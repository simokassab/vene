class CreateDhlShipmentJob < ApplicationJob
  queue_as :default

  retry_on StandardError, wait: :polynomially_longer, attempts: 3

  def perform(order_id)
    order = Order.find(order_id)

    # Skip if shipment already created or order not paid
    return if order.dhl_tracking_id.present?
    return unless order.payment_status == "paid"

    order.create_dhl_shipment
    Rails.logger.info("DHL shipment created for order #{order.id}: #{order.dhl_tracking_id}")
  rescue ArgumentError => e
    # Missing shipper config — log and skip (admin can create manually)
    Rails.logger.warn("DHL shipment skipped for order #{order.id}: #{e.message}")
  end
end
