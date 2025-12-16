# frozen_string_literal: true

module Dhl
  # Represents a DHL service point (pickup location)
  ServicePoint = Data.define(
    :id,                # Service point ID
    :name,              # Name of the service point
    :distance,          # Distance from search location (in meters)
    :street,            # Street address
    :number,            # House/building number
    :postal_code,       # Postal code
    :city,              # City name
    :country_code,      # Country code
    :latitude,          # Latitude coordinate
    :longitude,         # Longitude coordinate
    :opening_hours      # Opening hours information
  ) do
    def self.from_api_response(response)
      address = response["address"] || {}
      geo = response["geoLocation"] || {}

      new(
        id: response["id"] || response["shopId"],
        name: response["name"],
        distance: response["distance"],
        street: address["street"],
        number: address["number"],
        postal_code: address["postalCode"],
        city: address["city"],
        country_code: address["countryCode"],
        latitude: geo["latitude"],
        longitude: geo["longitude"],
        opening_hours: response["openingHours"] || []
      )
    end

    # Get full address as a string
    def full_address
      [
        "#{street} #{number}",
        "#{postal_code} #{city}",
        country_code
      ].join(", ")
    end

    # Get distance in kilometers
    def distance_km
      return nil if distance.blank?

      (distance.to_f / 1000).round(2)
    end

    # Check if the service point is open on a given day
    # @param day [String] Day name (e.g., 'Monday')
    # @return [Boolean]
    def open_on?(day)
      opening_hours.any? { |oh| oh["day"]&.downcase == day.downcase }
    end
  end
end
