# frozen_string_literal: true

module Dhl
  module Resources
    class ServicePoints
      def initialize(client)
        @client = client
      end

      # Note: DHL Express API doesn't have a dedicated service point/location API
      # like DHL Parcel does. Service points are typically managed through
      # DHL Express customer service or the MyDHL portal.
      #
      # For international shipping (Lebanon, KSA, UAE), shipments are typically
      # delivered directly to the recipient address rather than pickup points.

      # Get available DHL service points (placeholder)
      # Contact DHL Express customer service for service point information
      def search(postal_code:, country_code:, **options)
        raise NotImplementedError,
              "Service point search is not available in DHL Express API. " \
              "Please use DHL Express customer service or MyDHL portal for service point information."
      end

      def get(service_point_id)
        raise NotImplementedError,
              "Service point lookup is not available in DHL Express API. " \
              "Please use DHL Express customer service or MyDHL portal for service point information."
      end
    end
  end
end
