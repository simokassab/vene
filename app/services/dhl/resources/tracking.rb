# frozen_string_literal: true

module Dhl
  module Resources
    class Tracking
      def initialize(client)
        @client = client
      end

      # Get tracking information by tracking number using MyDHL Express API
      # @param tracking_number [String] The tracking number
      # @return [Dhl::TrackingInfo] Tracking information
      def get(tracking_number)
        response = @client.request(
          :get,
          "/shipments/#{tracking_number}/tracking"
        )

        TrackingInfo.from_api_response(response)
      end

      # Get tracking information for multiple tracking numbers
      # @param tracking_numbers [Array<String>] Array of tracking numbers
      # @return [Array<Dhl::TrackingInfo>] Array of tracking information
      def get_multiple(tracking_numbers)
        tracking_numbers.map { |number| get(number) }.compact
      end
    end
  end
end
