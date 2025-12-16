# frozen_string_literal: true

module Dhl
  # Represents a parcel to be shipped via DHL
  class Parcel
    attr_accessor :recipient, :sender, :options, :reference_identifier, :pieces

    def initialize(recipient: nil, sender: nil, options: nil, reference_identifier: nil)
      @recipient = recipient
      @sender = sender
      @options = options || ShipmentOptions.new
      @reference_identifier = reference_identifier
      @pieces = []
    end

    # Add a piece (package) to the parcel
    # @param weight [Integer] Weight in grams
    # @param quantity [Integer] Number of pieces (default: 1)
    def add_piece(weight:, quantity: 1)
      @pieces << { parcelType: "SMALL", quantity: quantity, weight: weight }
      self
    end

    # Set recipient
    # @param recipient [Dhl::Recipient] The recipient
    def with_recipient(recipient)
      @recipient = recipient
      self
    end

    # Set sender
    # @param sender [Dhl::Recipient] The sender
    def with_sender(sender)
      @sender = sender
      self
    end

    # Set options
    # @param options [Dhl::ShipmentOptions] The shipment options
    def with_options(options)
      @options = options
      self
    end

    # Set reference identifier
    # @param reference [String] The reference identifier
    def with_reference(reference)
      @reference_identifier = reference
      self
    end

    # Convert to DHL API format
    def to_hash
      raise ArgumentError, "Recipient is required" if @recipient.nil?
      raise ArgumentError, "Sender is required" if @sender.nil?

      hash = {
        receiver: @recipient.to_hash,
        shipper: @sender.to_hash
      }

      # Add options if present
      options_hash = @options.to_hash
      hash[:options] = options_hash if options_hash.any?

      # Add pieces (default to 1 small package if not specified)
      hash[:pieces] = @pieces.any? ? @pieces : [{ parcelType: "SMALL", quantity: 1 }]

      # Add reference if present
      hash[:orderReference] = @reference_identifier if @reference_identifier.present?

      hash
    end

    # Create a parcel from an Order model
    # @param order [Order] The order
    # @param sender [Dhl::Recipient] The sender/shipper information
    # @return [Dhl::Parcel] The parcel
    def self.from_order(order, sender:)
      recipient = Recipient.new(
        name: order.name,
        street: extract_street(order.address),
        number: extract_number(order.address),
        postal_code: extract_postal_code(order.address),
        city: order.city,
        country_code: country_code_for(order.country),
        email: order.email,
        phone: order.phone
      )

      parcel = new(
        recipient: recipient,
        sender: sender,
        reference_identifier: "ORDER-#{order.id}"
      )

      # Calculate total weight (estimate: 100g per item)
      total_weight = order.order_items.sum(:quantity) * 100
      parcel.add_piece(weight: total_weight)

      parcel
    end

    private

    # Helper method to extract street from address
    def self.extract_street(address)
      # Simple extraction - you may need to improve this based on your address format
      address.split(",").first&.strip || address
    end

    # Helper method to extract house number from address
    def self.extract_number(address)
      # Try to find a number in the address
      address.scan(/\d+/).first || "1"
    end

    # Helper method to extract postal code from address
    def self.extract_postal_code(address)
      # Try to find postal code pattern
      address.scan(/\b\d{4,6}\b/).first || ""
    end

    # Convert country name to ISO code
    def self.country_code_for(country)
      # Basic mapping - expand as needed
      country_codes = {
        "Netherlands" => "NL",
        "Belgium" => "BE",
        "Germany" => "DE",
        "France" => "FR",
        "United Kingdom" => "GB",
        "United States" => "US",
        "Egypt" => "EG"
        # Add more countries as needed
      }

      country_codes[country] || country.upcase[0..1]
    end
  end
end
