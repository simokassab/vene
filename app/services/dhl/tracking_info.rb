# frozen_string_literal: true

module Dhl
  # Represents tracking information for a DHL Express shipment
  TrackingInfo = Data.define(
    :tracking_number,       # Tracking number
    :status,                # Current status
    :description,           # Status description
    :events,                # Array of tracking events
    :origin,                # Origin location
    :destination,           # Destination location
    :estimated_delivery     # Estimated delivery date
  ) do
    def self.from_api_response(response)
      # MyDHL Express API: response has "shipments" array
      shipment = if response.is_a?(Hash) && response["shipments"]
        response["shipments"].first
      else
        response
      end

      return nil if shipment.nil?

      events_data = shipment["events"] || []

      events = events_data.map do |event|
        location = if event["serviceArea"].is_a?(Array)
          event["serviceArea"].first&.dig("description")
        elsif event["serviceArea"].is_a?(Hash)
          event["serviceArea"]["description"]
        elsif event.dig("location", "address", "addressLocality")
          event.dig("location", "address", "addressLocality")
        end

        timestamp = if event["date"] && event["time"]
          "#{event['date']}T#{event['time']}"
        else
          event["timestamp"] || event["date"]
        end

        TrackingEvent.new(
          timestamp: timestamp,
          status_code: event["typeCode"] || event["statusCode"],
          description: event["description"],
          location: location
        )
      end

      new(
        tracking_number: shipment["shipmentTrackingNumber"] || shipment["id"],
        status: shipment["status"],
        description: shipment["description"],
        events: events,
        origin: extract_location(shipment, "origin") || extract_location(shipment, "shipperDetails"),
        destination: extract_location(shipment, "destination") || extract_location(shipment, "receiverDetails"),
        estimated_delivery: parse_date(shipment["estimatedDeliveryDate"])
      )
    end

    # Check if delivered
    def delivered?
      status&.downcase == "delivered" || description&.downcase&.include?("delivered")
    end

    # Check if the shipment is in transit
    def in_transit?
      !delivered? && status.present?
    end

    # Get the latest event
    def latest_event
      events.first
    end

    # Get formatted status
    def status_description
      status.presence || description
    end

    private

    def self.extract_location(data, key)
      section = data[key]
      return nil unless section.is_a?(Hash)

      # Try multiple paths, return nil if all are blank
      value = section.dig("address", "addressLocality").presence ||
        section.dig("postalAddress", "cityName").presence ||
        section.dig("serviceArea", 0, "description").presence ||
        section["name"].presence

      value
    end

    def self.parse_date(date_string)
      return nil if date_string.blank?

      Date.parse(date_string)
    rescue ArgumentError
      nil
    end
  end

  # Represents a single tracking event
  TrackingEvent = Data.define(
    :timestamp,     # Event timestamp
    :status_code,   # Event status code
    :description,   # Event description
    :location       # Event location
  ) do
    def formatted_time
      return "" if timestamp.blank?

      Time.parse(timestamp).strftime("%Y-%m-%d %H:%M")
    rescue ArgumentError
      timestamp
    end
  end
end
