# frozen_string_literal: true

module Dhl
  module Resources
    class Tracking
      def initialize(client)
        @client = client
      end

      # Get tracking information by tracking number using DHL unified tracking API
      # @param tracking_number [String] The tracking number
      # @return [Dhl::TrackingInfo] Tracking information
      def get(tracking_number)
        response = @client.request(
          :get,
          "/track/shipments?trackingNumber=#{tracking_number}",
          base_url: Dhl::Client::TRACKING_BASE_URL
        )

        # The response contains an array of shipments
        shipments = response["shipments"] || []
        return nil if shipments.empty?

        TrackingInfo.from_api_response(shipments.first)
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
