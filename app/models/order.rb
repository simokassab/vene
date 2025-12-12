class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy

  accepts_nested_attributes_for :order_items

  STATUSES = %w[pending payment_pending paid shipped delivered canceled].freeze
  PAYMENT_STATUSES = %w[pending paid failed].freeze

  validates :name, :email, :phone, :country, :city, :address, presence: true
  validates :status, inclusion: { in: STATUSES }
  validates :payment_status, inclusion: { in: PAYMENT_STATUSES }

  before_validation :set_defaults

  def tax_type_local?
    tax_type == "local"
  end

  def update_totals!(settings)
    self.subtotal = order_items.sum(&:line_total)
    self.tax_amount = if country == settings.local_country
                        subtotal * (settings.local_tax_rate || 0) / 100
                      else
                        subtotal * (settings.international_tax_rate || 0) / 100
                      end
    self.shipping_amount = settings.shipping_flat_rate || 0
    self.total_amount = subtotal + tax_amount + shipping_amount
    save!
  end

  def cancel_order!
    return false if status == "canceled"

    transaction do
      # Restore stock ONLY for regular orders (not pre-orders)
      order_items.regular_orders.each do |item|
        if item.product_variant_id.present?
          item.product_variant.increment!(:stock_quantity, item.quantity)
        else
          item.product.increment!(:stock_quantity, item.quantity)
        end
      end

      update!(status: "canceled")
    end

    true
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

  private

  def set_defaults
    self.status ||= "payment_pending"
    self.payment_status ||= "pending"
    self.shipping_method ||= "DHL"
  end
end
