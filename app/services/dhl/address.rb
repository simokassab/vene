# frozen_string_literal: true

module Dhl
  # Represents an address for DHL Express shipments (shipper or receiver)
  Address = Data.define(
    :city_name,           # City name
    :country_code,        # ISO 2-letter country code (e.g., 'LB', 'SA', 'AE')
    :postal_code,         # Postal/ZIP code
    :address_line1,       # Street address line 1
    :address_line2,       # Street address line 2 (optional)
    :address_line3,       # Street address line 3 (optional)
    :country_name         # Full country name (optional)
  ) do
    def initialize(
      city_name:,
      country_code:,
      postal_code:,
      address_line1:,
      address_line2: nil,
      address_line3: nil,
      country_name: nil
    )
      super
    end

    # Convert to DHL Express API format
    def to_hash
      hash = {
        cityName: city_name,
        countryCode: country_code,
        postalCode: postal_code,
        addressLine1: address_line1
      }

      hash[:addressLine2] = address_line2 if address_line2.present?
      hash[:addressLine3] = address_line3 if address_line3.present?
      hash[:countryName] = country_name if country_name.present?

      hash
    end

    # Create address from Order model
    def self.from_order(order)
      new(
        city_name: order.city,
        country_code: order.country_code.presence || country_code_for(order.country),
        postal_code: order.postal_code.presence || extract_postal_code(order.address_text),
        address_line1: order.street_address || order.address_text,
        address_line2: order.building,
        country_name: order.country
      )
    end

    # Convert country name to ISO code
    def self.country_code_for(country)
      country_codes = {
        "Lebanon" => "LB",
        "Saudi Arabia" => "SA",
        "United Arab Emirates" => "AE",
        "UAE" => "AE",
        "Egypt" => "EG",
        "Jordan" => "JO",
        "Kuwait" => "KW",
        "Bahrain" => "BH",
        "Oman" => "OM",
        "Qatar" => "QA"
      }

      country_codes[country] || country.upcase[0..1]
    end

    # Extract postal code from address string
    def self.extract_postal_code(address)
      address.scan(/\b\d{4,6}\b/).first || ""
    end
  end
end
