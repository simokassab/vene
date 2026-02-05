# frozen_string_literal: true

module Dhl
  # Represents a DHL Express shipment creation request
  class ShipmentRequest
    attr_accessor :planned_shipping_date, :product_code, :accounts,
                  :shipper, :receiver, :packages, :content_description,
                  :incoterm, :is_customs_declarable, :output_image_properties,
                  :declared_value, :declared_value_currency, :unit_of_measurement,
                  :export_line_items

    def initialize(
      planned_shipping_date: nil,
      product_code: "P",
      accounts: [],
      content_description: nil,
      incoterm: "DAP",
      is_customs_declarable: true,
      declared_value: 0,
      declared_value_currency: "USD",
      unit_of_measurement: "metric"
    )
      @planned_shipping_date = planned_shipping_date || Time.current.strftime("%Y-%m-%dT%H:%M:%S GMT%:z")
      @product_code = product_code
      @accounts = accounts
      @shipper = nil
      @receiver = nil
      @packages = []
      @content_description = content_description
      @incoterm = incoterm
      @is_customs_declarable = is_customs_declarable
      @declared_value = declared_value
      @declared_value_currency = declared_value_currency
      @unit_of_measurement = unit_of_measurement
      @export_line_items = []
      @output_image_properties = default_output_image_properties
    end

    # Set shipper details
    # @param address [Dhl::Address] Shipper address
    # @param contact [Dhl::Contact] Shipper contact
    def with_shipper(address:, contact:)
      @shipper = { address: address, contact: contact }
      self
    end

    # Set receiver details
    # @param address [Dhl::Address] Receiver address
    # @param contact [Dhl::Contact] Receiver contact
    def with_receiver(address:, contact:)
      @receiver = { address: address, contact: contact }
      self
    end

    # Add a package
    # @param package [Dhl::Package] Package details
    def add_package(package)
      @packages << package
      self
    end

    # Set account number
    # @param account_number [String] DHL account number
    def with_account(account_number)
      @accounts = [{ typeCode: "shipper", number: account_number }]
      self
    end

    # Convert to DHL Express API format
    def to_hash
      validate!

      {
        plannedShippingDateAndTime: @planned_shipping_date,
        pickup: { isRequested: false },
        productCode: @product_code,
        accounts: @accounts,
        customerDetails: {
          shipperDetails: shipper_details,
          receiverDetails: receiver_details
        },
        content: content_details,
        outputImageProperties: @output_image_properties
      }
    end

    # Create a shipment request from an Order
    # @param order [Order] The order
    # @param shipper_address [Dhl::Address] Shipper address
    # @param shipper_contact [Dhl::Contact] Shipper contact
    # @param account_number [String] DHL account number
    # @return [Dhl::ShipmentRequest]
    def self.from_order(order, shipper_address:, shipper_contact:, account_number:)
      receiver_address = Address.from_order(order)
      receiver_contact = Contact.new(
        full_name: order.name,
        company_name: order.name,
        phone: order.phone,
        email: order.email
      )

      dest_country = receiver_address.country_code
      is_domestic = shipper_address.country_code == dest_country
      # "N" = DHL Express Domestic, "P" = DHL Express Worldwide
      product_code = is_domestic ? "N" : "P"

      request = new(
        content_description: "Jewelry Order ##{order.id}",
        product_code: product_code,
        declared_value: order.subtotal,
        declared_value_currency: order.currency || "USD",
        is_customs_declarable: !is_domestic
      )

      request.with_shipper(address: shipper_address, contact: shipper_contact)
      request.with_receiver(address: receiver_address, contact: receiver_contact)
      request.with_account(account_number)

      # Add packages based on order items (estimate 0.5 KG per item)
      total_weight = [order.order_items.sum(:quantity) * 0.5, 0.5].max
      request.add_package(Package.new(weight: total_weight, length: 20, width: 15, height: 10))

      # Build export declaration line items (only for international shipments)
      unless is_domestic
        order.order_items.includes(:product).each_with_index do |item, index|
          product_name = item.product.name_en.presence || item.product.name_ar.presence || "Jewelry"
          request.export_line_items << {
            number: index + 1,
            description: product_name.truncate(50),
            price: item.unit_price.to_f,
            quantity: { value: item.quantity, unitOfMeasurement: "PCS" },
            weight: { netValue: (item.quantity * 0.5).round(2), grossValue: (item.quantity * 0.5).round(2) },
            commodityCodes: [{ typeCode: "outbound", value: "711319" }], # HS code for jewelry
            manufacturerCountry: shipper_address.country_code,
            exportReasonType: "permanent"
          }
        end
      end

      request
    end

    private

    def validate!
      raise ArgumentError, "Shipper details are required" if @shipper.nil?
      raise ArgumentError, "Receiver details are required" if @receiver.nil?
      raise ArgumentError, "At least one package is required" if @packages.empty?
      raise ArgumentError, "Account number is required" if @accounts.empty?
    end

    def shipper_details
      {
        postalAddress: @shipper[:address].to_hash,
        contactInformation: @shipper[:contact].to_hash
      }
    end

    def receiver_details
      {
        postalAddress: @receiver[:address].to_hash,
        contactInformation: @receiver[:contact].to_hash
      }
    end

    def content_details
      details = {
        packages: @packages.map(&:to_hash),
        isCustomsDeclarable: @is_customs_declarable,
        description: @content_description || "General Goods",
        incoterm: @incoterm,
        unitOfMeasurement: @unit_of_measurement,
        declaredValue: @declared_value.to_f,
        declaredValueCurrency: @declared_value_currency
      }

      if @is_customs_declarable && @export_line_items.any?
        details[:exportDeclaration] = {
          lineItems: @export_line_items,
          invoice: {
            number: "INV-#{Time.current.strftime('%Y%m%d')}",
            date: Time.current.strftime("%Y-%m-%d")
          },
          exportReason: "Sale",
          exportReasonType: "permanent"
        }
      end

      details
    end

    def default_output_image_properties
      {
        imageOptions: [
          {
            typeCode: "label",
            templateName: "ECOM26_A4_001",
            isRequested: true
          }
        ]
      }
    end
  end
end
