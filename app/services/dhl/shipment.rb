# frozen_string_literal: true

module Dhl
  # Represents a created DHL Express shipment with tracking and label information
  Shipment = Data.define(
    :shipment_tracking_number,  # Main tracking number
    :tracking_numbers,          # Array of tracking numbers (for multiple packages)
    :documents,                 # Array of document objects (labels)
    :shipment_charges,          # Charges information
    :pickup_details             # Pickup information
  ) do
    def self.from_api_response(response)
      # Extract tracking numbers
      shipment_tracking_number = response["shipmentTrackingNumber"]
      packages = response["packages"] || []
      tracking_numbers = packages.map { |p| p["trackingNumber"] }.compact

      new(
        shipment_tracking_number: shipment_tracking_number,
        tracking_numbers: tracking_numbers,
        documents: response["documents"] || [],
        shipment_charges: response["shipmentCharges"] || [],
        pickup_details: response["pickupDetails"]
      )
    end

    # Get the main tracking number
    def tracking_number
      shipment_tracking_number
    end

    # Get all tracking numbers (for multiple packages)
    def all_tracking_numbers
      [shipment_tracking_number] + tracking_numbers
    end

    # Check if shipment was created successfully
    def success?
      shipment_tracking_number.present?
    end

    # Get label content (base64 encoded)
    def label_content
      label_document = documents.find { |doc| doc["typeCode"] == "label" }
      label_document&.dig("content")
    end

    # Decode label content to binary
    def label_binary
      return nil if label_content.blank?

      Base64.decode64(label_content)
    end

    # Get total charges
    def total_charge
      return nil if shipment_charges.empty?

      shipment_charges.sum { |charge| charge.dig("price", "value").to_f }
    end

    # Get currency code
    def currency
      shipment_charges.first&.dig("price", "currencyCode")
    end
  end
end
