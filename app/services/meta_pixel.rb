# Builds Meta (Facebook) Pixel standard-event payloads.
#
# Mirrors the Ga4 service. Intent events (ViewContent, AddToCart,
# InitiateCheckout) report base USD prices, since product/cart amounts are
# stored in USD and only converted for display. The Purchase event reports the
# order's own currency and the amount actually charged, so Meta receives the
# real transaction value/currency.
module MetaPixel
  module_function

  PIXEL_ID = "743405888542926"

  # A single Meta "contents" entry for a product line.
  def content(product, quantity: 1, price: nil)
    {
      id: product.id.to_s,
      quantity: quantity.to_i,
      item_price: money(price || product.current_price)
    }
  end

  # Wraps a standard-event name with its parameter Hash. Blank params are
  # dropped so we never send nil category/name values to Meta.
  def event(name, **params)
    { event: name, data: params.compact }
  end

  def view_content_event(product)
    event(
      "ViewContent",
      content_ids: [ product.id.to_s ],
      content_name: product.name(:en),
      content_category: product.category&.name(:en),
      content_type: "product",
      value: money(product.current_price),
      currency: "USD"
    )
  end

  def add_to_cart_event(product, variant: nil, quantity: 1)
    qty = quantity.to_i
    event(
      "AddToCart",
      content_ids: [ product.id.to_s ],
      content_name: product.name(:en),
      content_type: "product",
      contents: [ content(product, quantity: qty) ],
      value: money(product.current_price.to_d * qty),
      currency: "USD"
    )
  end

  def initiate_checkout_event(cart)
    items = cart.items
    event(
      "InitiateCheckout",
      content_ids: items.map { |i| i.product.id.to_s },
      contents: items.map { |i| content(i.product, quantity: i.quantity) },
      content_type: "product",
      num_items: items.sum(&:quantity),
      value: money(cart.subtotal),
      currency: "USD"
    )
  end

  def purchase_event(order)
    items = order.order_items.includes(:product_variant, product: :category).to_a
    event(
      "Purchase",
      content_ids: items.map { |oi| oi.product_id.to_s },
      contents: items.map { |oi| content(oi.product, quantity: oi.quantity, price: oi.unit_price) },
      content_type: "product",
      num_items: items.sum(&:quantity),
      value: money(order.total_amount),
      currency: order.currency.presence || "USD"
    )
  end

  # Meta accepts floats; round wide enough to keep 3-decimal currencies (e.g. KWD).
  def money(amount)
    amount.to_f.round(3)
  end
end
