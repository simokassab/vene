# frozen_string_literal: true

module Dhl
  # Represents a package in a DHL Express shipment
  Package = Data.define(
    :weight,              # Weight in KG
    :length,              # Length in CM
    :width,               # Width in CM
    :height,              # Height in CM
    :customer_references  # Optional customer references
  ) do
    def initialize(
      weight:,
      length: nil,
      width: nil,
      height: nil,
      customer_references: nil
    )
      super
    end

    # Convert to DHL Express API format
    def to_hash
      hash = {
        weight: weight
      }

      # Add dimensions if provided
      if length.present? && width.present? && height.present?
        hash[:dimensions] = {
          length: length,
          width: width,
          height: height
        }
      end

      hash[:customerReferences] = customer_references if customer_references.present?

      hash
    end
  end
end
