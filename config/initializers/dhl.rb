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
      city_name: "Beirut",
      country_code: "LB",
      postal_code: "1103",
      address_line1: "Kurdly building, Ahmad Al Jammal street",
      address_line2: "Mosaytibeh, 6th floor",
      country_name: "Lebanon"
    )

    # Shipper Contact
    config.default_shipper_contact = Dhl::Contact.new(
      full_name: "Nadin Kaakati",
      company_name: "Golden Arch for Commercial",
      phone: "0096178729590",
      email: "admin@venejewelry.com"
    )
  end
end
