# frozen_string_literal: true

module Dhl
  # Represents contact information for DHL Express shipments
  Contact = Data.define(
    :full_name,          # Full name of contact person
    :company_name,       # Company name
    :phone,              # Phone number
    :email               # Email address (optional)
  ) do
    def initialize(
      full_name:,
      company_name:,
      phone:,
      email: nil
    )
      super
    end

    # Convert to DHL Express API format
    def to_hash
      hash = {
        fullName: full_name,
        companyName: company_name,
        phone: phone
      }

      hash[:email] = email if email.present?

      hash
    end
  end
end
