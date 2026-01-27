# frozen_string_literal: true

module Dhl
  module Resources
    class Shipments
      def initialize(client)
        @client = client
      end

      # Create a new DHL Express shipment
      # @param shipment_request [Dhl::ShipmentRequest] The shipment request
      # @return [Dhl::Shipment] The created shipment
      def create(shipment_request)
        validate_shipment_request!(shipment_request)

        payload = shipment_request.to_hash
        response = @client.request(:post, "/shipments", body: payload)

        Shipment.from_api_response(response)
      end

      # Get shipment by tracking number
      # @param tracking_number [String] The tracking number
      # @return [Hash] The shipment details
      def get(tracking_number)
        @client.request(:get, "/shipments/#{tracking_number}")
      end

      # Get shipping rates via DHL Express Rating API (GET /rates)
      # @param rate_params [Hash] Query parameters for the rate request
      # @return [Array<Hash>] Available products with rates
      def get_rates(rate_params)
        response = @client.request(:get, "/rates", params: rate_params)
        response["products"] || []
      end

      # Cancel a shipment (if allowed)
      # @param tracking_number [String] The tracking number
      # @return [Boolean] Success status
      def cancel(tracking_number)
        @client.request(:delete, "/shipments/#{tracking_number}")
        true
      rescue Dhl::Client::Error
        false
      end

      private

      def validate_shipment_request!(shipment_request)
        raise ArgumentError, "Must be a Dhl::ShipmentRequest" unless shipment_request.is_a?(ShipmentRequest)
        raise ArgumentError, "Must have shipper details" if shipment_request.shipper.nil?
        raise ArgumentError, "Must have receiver details" if shipment_request.receiver.nil?
        raise ArgumentError, "Must have at least one package" if shipment_request.packages.empty?
      end
    end
  end
end
