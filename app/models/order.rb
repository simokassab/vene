class Order < ApplicationRecord
  belongs_to :user
  belongs_to :coupon, optional: true
  belongs_to :address, optional: true
  has_many :order_items, dependent: :destroy

  accepts_nested_attributes_for :order_items

  STATUSES = %w[pending payment_pending paid shipped delivered canceled].freeze
  PAYMENT_STATUSES = %w[pending paid failed].freeze

  validates :name, :email, :phone, :country, :city, :street_address, presence: true
  validates :status, inclusion: { in: STATUSES }
  validates :payment_status, inclusion: { in: PAYMENT_STATUSES }

  before_validation :set_defaults

  def update_totals!(settings, shipping_override: nil)
    self.subtotal = order_items.sum(&:line_total)
    self.tax_amount = 0 # Prices include tax
    self.shipping_amount = shipping_override || settings.shipping_flat_rate || 0
    self.total_amount = subtotal - discount_amount + shipping_amount
    save!
  end

  # Called after payment is confirmed (via webhook or success redirect)
  def confirm_payment!
    return if payment_status == "paid"

    transaction do
      update!(payment_status: "paid", status: "paid", paid_at: Time.current)
      decrement_stock!
    end

    # Create DHL shipment in the background
    CreateDhlShipmentJob.perform_later(id)
  end

  # Decrement stock for all order items (only for non-preorder items)
  def decrement_stock!
    order_items.regular_orders.each(&:decrement_stock!)
  end

  def cancel_order!
    return false if status == "canceled"

    transaction do
      # Only restore stock if payment was confirmed (stock was decremented)
      if payment_status == "paid"
        order_items.regular_orders.each do |item|
          if item.product_variant_id.present?
            item.product_variant.increment!(:stock_quantity, item.quantity)
          else
            item.product.increment!(:stock_quantity, item.quantity)
          end
        end
      end

      update!(status: "canceled")
    end

    true
  end

  # Legacy address string (avoids conflict with belongs_to :address association)
  def address_text
    if street_address.present?
      [street_address, building].compact_blank.join(", ")
    else
      read_attribute(:address)
    end
  end

  # Pre-order helper methods
  def has_preorder_items?
    order_items.preorders.exists?
  end

  def all_preorder_items?
    order_items.any? && order_items.all?(&:is_preorder?)
  end

  def earliest_preorder_delivery_date
    order_items.preorders.minimum(:preorder_estimated_delivery_date)
  end

  def latest_preorder_delivery_date
    order_items.preorders.maximum(:preorder_estimated_delivery_date)
  end

  # DHL Express Shipment Integration

  # Create a DHL Express shipment for this order
  # @param shipper_address [Dhl::Address] The shipper address (optional, uses default)
  # @param shipper_contact [Dhl::Contact] The shipper contact (optional, uses default)
  # @param account_number [String] DHL account number (optional, uses ENV variable)
  # @return [Dhl::Shipment] The created shipment
  def create_dhl_shipment(shipper_address: nil, shipper_contact: nil, account_number: nil)
    shipper_address ||= Dhl.default_shipper_address
    shipper_contact ||= Dhl.default_shipper_contact
    account_number ||= ENV["DHL_EXPRESS_ACCOUNT_NUMBER"]

    raise ArgumentError, "Shipper address is required" if shipper_address.nil?
    raise ArgumentError, "Shipper contact is required" if shipper_contact.nil?
    raise ArgumentError, "DHL account number is required" if account_number.blank?

    client = Dhl.client
    shipment_request = Dhl::ShipmentRequest.from_order(
      self,
      shipper_address: shipper_address,
      shipper_contact: shipper_contact,
      account_number: account_number
    )

    shipment = client.shipments.create(shipment_request)

    # Update order with tracking information
    if shipment.success?
      update!(dhl_tracking_id: shipment.tracking_number)

      # Optionally store the label
      if shipment.label_binary.present?
        # You can store the label in ActiveStorage or file system here
        Rails.logger.info("Shipment label created for order #{id}")
      end
    end

    shipment
  end

  # Get DHL Express tracking information for this order
  # @return [Dhl::TrackingInfo, nil] The tracking information or nil if no tracking ID
  def dhl_tracking_info
    return nil if dhl_tracking_id.blank?

    client = Dhl.client
    client.tracking.get(dhl_tracking_id)
  rescue Dhl::Client::Error => e
    Rails.logger.error("Failed to get DHL Express tracking info for order #{id}: #{e.message}")
    nil
  end

  # Get DHL Express label PDF for this order
  # Note: Labels are returned during shipment creation and should be stored
  # This method attempts to retrieve it via API
  # @return [String, nil] The label PDF binary or nil
  def dhl_label_pdf
    return nil if dhl_tracking_id.blank?

    client = Dhl.client
    label_content = client.labels.get(dhl_tracking_id)

    return nil if label_content.blank?

    Base64.decode64(label_content)
  rescue Dhl::Client::Error => e
    Rails.logger.error("Failed to get DHL Express label for order #{id}: #{e.message}")
    nil
  end

  # Check if order has DHL tracking
  def has_dhl_tracking?
    dhl_tracking_id.present?
  end

  # Get shipping rates for this order (before creating shipment)
  # @return [Array<Hash>] Available shipping rates
  def get_dhl_shipping_rates
    client = Dhl.client

    # Create a rate request similar to shipment request but for rating
    shipper_address = Dhl.default_shipper_address
    shipper_contact = Dhl.default_shipper_contact
    account_number = ENV["DHL_EXPRESS_ACCOUNT_NUMBER"]

    return [] if shipper_address.nil? || shipper_contact.nil? || account_number.blank?

    rate_request = Dhl::ShipmentRequest.from_order(
      self,
      shipper_address: shipper_address,
      shipper_contact: shipper_contact,
      account_number: account_number
    )

    client.shipments.get_rates(rate_request)
  rescue Dhl::Client::Error => e
    Rails.logger.error("Failed to get DHL Express rates for order #{id}: #{e.message}")
    []
  end

  private

  def set_defaults
    self.status ||= "payment_pending"
    self.payment_status ||= "pending"
    self.shipping_method ||= "DHL"
    self.currency ||= Setting.current.default_currency
    populate_legacy_address
  end

  def populate_legacy_address
    if street_address.present? && read_attribute(:address).blank?
      write_attribute(:address, [street_address, building].compact_blank.join(", "))
    end
  end
end
