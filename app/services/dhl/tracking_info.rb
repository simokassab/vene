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
      # DHL Unified Tracking API response format
      tracking_number = response["id"]
      status_info = response["status"] || {}
      events_data = response["events"] || []

      # Parse events
      events = events_data.map do |event|
        TrackingEvent.new(
          timestamp: event["timestamp"],
          status_code: event["statusCode"],
          description: event["description"],
          location: event.dig("location", "address", "addressLocality")
        )
      end

      new(
        tracking_number: tracking_number,
        status: status_info["statusCode"],
        description: status_info["description"],
        events: events,
        origin: response.dig("origin", "address", "addressLocality"),
        destination: response.dig("destination", "address", "addressLocality"),
        estimated_delivery: parse_date(response.dig("estimatedDeliveryDate"))
      )
    end

    # Check if delivered
    def delivered?
      status == "delivered" || description&.downcase&.include?("delivered")
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
      description || status
    end

    private

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
