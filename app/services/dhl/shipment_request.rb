# frozen_string_literal: true

module Dhl
  # Represents a DHL Express shipment creation request
  class ShipmentRequest
    attr_accessor :planned_shipping_date, :product_code, :accounts,
                  :shipper, :receiver, :packages, :content_description,
                  :incoterm, :is_customs_declarable, :output_image_properties

    def initialize(
      planned_shipping_date: nil,
      product_code: "P",
      accounts: [],
      content_description: nil,
      incoterm: "DAP",
      is_customs_declarable: true
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

      request = new(
        content_description: "Jewelry Order ##{order.id}",
        product_code: "P" # DHL Express Worldwide
      )

      request.with_shipper(address: shipper_address, contact: shipper_contact)
      request.with_receiver(address: receiver_address, contact: receiver_contact)
      request.with_account(account_number)

      # Add packages based on order items (estimate 0.5 KG per item)
      total_weight = order.order_items.sum(:quantity) * 0.5
      request.add_package(Package.new(weight: total_weight))

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
      {
        packages: @packages.map(&:to_hash),
        isCustomsDeclarable: @is_customs_declarable,
        description: @content_description || "General Goods",
        incoterm: @incoterm
      }
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
