# frozen_string_literal: true

# DHL Express API Configuration
# Set your DHL Express credentials in environment variables:
# - DHL_EXPRESS_API_KEY: Your DHL Express API key
# - DHL_EXPRESS_API_SECRET: Your DHL Express API secret
# - DHL_EXPRESS_ACCOUNT_NUMBER: Your DHL Express 9-digit account number
#
# You must configure default shipper address and contact information below

module Dhl
  class << self
    attr_accessor :default_shipper_address, :default_shipper_contact

    # Configure DHL Express with default shipper information
    def configure
      yield self if block_given?
    end

    # Create a new DHL Express client
    def client
      Client.new
    end
  end
end

# REQUIRED: Configure your default shipper information
# This block runs after Rails autoloading is complete to ensure DHL classes are available

Rails.application.config.to_prepare do
  Dhl.configure do |config|
    # Shipper Address
    config.default_shipper_address = Dhl::Address.new(
      city_name: "Beirut",              # Your city
      country_code: "LB",               # Your country code (LB=Lebanon, SA=Saudi Arabia, AE=UAE)
      postal_code: "1234",              # Your postal code
      address_line1: "Your Street Name, Building Number",  # Full address
      address_line2: nil,               # Optional additional address line
      country_name: "Lebanon"           # Full country name
    )

    # Shipper Contact
    config.default_shipper_contact = Dhl::Contact.new(
      full_name: "Vene Jewelry",        # Your business name or contact person
      company_name: "Vene Jewelry",     # Your company name
      phone: "+961-X-XXXXXX",           # Your phone with country code
      email: "shipping@venejewelry.com" # Your email
    )
  end
end
