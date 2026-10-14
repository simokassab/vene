# Builds TikTok Pixel standard-event payloads.
#
# Mirrors the MetaPixel service: AddToCart reports base USD prices (product
# amounts are stored in USD and only converted for display), while Purchase
# reports the order's own currency and the amount actually charged.
module TiktokPixel
  module_function

  PIXEL_ID = "DB7MK13C77U45L31J2V0"

  # A single TikTok "contents" entry for a product line. content_id matches the
  # Meta/GA4 item id (the product id) so catalogs line up across platforms.
  def content(product, quantity: 1, price: nil)
    {
      content_id: product.id.to_s,
      content_type: "product",
      content_name: product.name(:en),
      quantity: quantity.to_i,
      price: money(price || product.current_price)
    }
  end

  # Wraps a standard-event name with its parameter Hash, dropping blank values.
  def event(name, **params)
    { event: name, data: params.compact }
  end

  def add_to_cart_event(product, quantity: 1)
    qty = quantity.to_i
    event(
      "AddToCart",
      contents: [ content(product, quantity: qty) ],
      content_type: "product",
      value: money(product.current_price.to_d * qty),
      currency: "USD"
    )
  end

  def purchase_event(order)
    items = order.order_items.includes(:product).to_a
    event(
      "Purchase",
      contents: items.map { |oi| content(oi.product, quantity: oi.quantity, price: oi.unit_price) },
      content_type: "product",
      value: money(order.total_amount),
      currency: order.currency.presence || "USD"
    )
  end

  # Round wide enough to keep 3-decimal currencies (e.g. KWD).
  def money(amount)
    amount.to_f.round(3)
  end
end
