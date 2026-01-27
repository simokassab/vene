# frozen_string_literal: true

module Dhl
  module Resources
    class AddressValidate
      def initialize(client)
        @client = client
      end

      # Validate a city name against DHL's address database
      # @param country_code [String] ISO 2-letter country code
      # @param city_name [String] City name to validate
      # @param type [String] Address type ("delivery" or "pickup")
      # @return [Hash] { valid:, addresses:, postal_code:, city_name:, service_area: }
      def validate(country_code:, city_name:, type: "delivery")
        response = @client.request(:get, "/address-validate", params: {
          countryCode: country_code, cityName: city_name, type: type
        })
        addresses = response["address"] || []
        {
          valid: addresses.any?,
          addresses: addresses,
          postal_code: addresses.first&.dig("postalCode"),
          city_name: addresses.first&.dig("cityName"),
          service_area: addresses.first&.dig("serviceArea", "description")
        }
      rescue Dhl::Client::RequestError
        # DHL returns 400 when city is not recognized - expected outcome
        { valid: false, addresses: [], postal_code: nil, city_name: nil, service_area: nil }
      end
    end
  end
end
