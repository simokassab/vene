# frozen_string_literal: true

module Dhl
  # Represents a recipient or sender address for DHL shipments
  Recipient = Data.define(
    :name,              # Full name or company name
    :street,            # Street address
    :number,            # House/building number
    :postal_code,       # Postal/ZIP code
    :city,              # City name
    :country_code,      # ISO 2-letter country code (e.g., 'NL', 'US')
    :email,             # Email address (optional)
    :phone,             # Phone number (optional)
    :company_name,      # Company name (optional, for business addresses)
    :addition           # Address addition/apartment number (optional)
  ) do
    def initialize(
      name:,
      street:,
      number:,
      postal_code:,
      city:,
      country_code:,
      email: nil,
      phone: nil,
      company_name: nil,
      addition: nil
    )
      super
    end

    # Convert to DHL API format
    def to_hash
      hash = {
        name: {
          firstName: extract_first_name,
          lastName: extract_last_name
        },
        address: {
          street: street,
          number: number,
          postalCode: postal_code,
          city: city,
          countryCode: country_code
        }
      }

      hash[:address][:addition] = addition if addition.present?
      hash[:email] = email if email.present?
      hash[:phoneNumber] = phone if phone.present?
      hash[:name][:companyName] = company_name if company_name.present?

      hash
    end

    private

    def extract_first_name
      return "" if name.blank?

      parts = name.split(" ")
      parts.size > 1 ? parts[0..-2].join(" ") : parts[0]
    end

    def extract_last_name
      return "" if name.blank?

      parts = name.split(" ")
      parts.size > 1 ? parts[-1] : ""
    end
  end
end
