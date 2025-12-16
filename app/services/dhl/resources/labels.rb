# frozen_string_literal: true

module Dhl
  module Resources
    class Labels
      def initialize(client)
        @client = client
      end

      # Get label by shipment tracking number
      # Note: DHL Express returns label as base64 in the shipment creation response
      # This is a helper method to retrieve it separately if needed
      # @param tracking_number [String] The tracking number
      # @return [String] The label content (base64)
      def get(tracking_number)
        response = @client.request(:get, "/shipments/#{tracking_number}/label")
        response["documents"]&.first&.dig("content")
      end

      # Get label in specific format
      # @param tracking_number [String] The tracking number
      # @param format [String] The label format (PDF, ZPL, etc.)
      # @return [String] The label content
      def get_with_format(tracking_number, format: "PDF")
        response = @client.request(
          :get,
          "/shipments/#{tracking_number}/label?format=#{format}"
        )
        response["documents"]&.first&.dig("content")
      end
    end
  end
end
