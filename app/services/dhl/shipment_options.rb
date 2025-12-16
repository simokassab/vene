# frozen_string_literal: true

module Dhl
  # Represents shipment options for DHL parcels
  ShipmentOptions = Data.define(
    :description,           # Label description
    :mailbox_package,       # Boolean: fits in mailbox
    :recipient_only,        # Boolean: only recipient can sign
    :signature_required,    # Boolean: signature required
    :evening_delivery,      # Boolean: evening delivery
    :extra_assurance,       # Decimal: extra insurance amount
    :cash_on_delivery,      # Decimal: COD amount
    :service_point_id       # String: delivery to service point
  ) do
    def initialize(
      description: nil,
      mailbox_package: false,
      recipient_only: false,
      signature_required: false,
      evening_delivery: false,
      extra_assurance: nil,
      cash_on_delivery: nil,
      service_point_id: nil
    )
      super
    end

    # Convert to DHL API format
    def to_hash
      hash = {}

      hash[:description] = description if description.present?

      # Boolean options
      options = []
      options << "MAIL_BOX" if mailbox_package
      options << "RECIPIENT_ONLY" if recipient_only
      options << "SIGNATURE" if signature_required
      options << "EVENING" if evening_delivery

      hash[:options] = options if options.any?

      # Financial options
      hash[:extraAssurance] = { amount: extra_assurance } if extra_assurance.present?
      hash[:cashOnDelivery] = { amount: cash_on_delivery } if cash_on_delivery.present?

      # Service point
      hash[:servicePointId] = service_point_id if service_point_id.present?

      hash
    end
  end
end
