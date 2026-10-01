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
  BRAND = "VENÈ Jewelry"

  # Catalog fields Meta's pixel reads from product-page microdata. `id` must equal
  # the content_ids sent by the events above (the catalog's retailer_item_id).
  # Prices are the base USD amounts, matching ViewContent. `url`/`image` are
  # passed in already absolute since they depend on the request host.
  def catalog_item(product, url:, image:)
    {
      id: product.id.to_s,
      title: product.name(:en),
      description: product.description(:en).to_s.squish.truncate(5000),
      availability: availability(product),
      condition: "new",
      price: format("%.2f", product.current_price),
      currency: "USD",
      image: image,
      brand: BRAND,
      url: url
    }
  end

  # Meta availability value: stock on the product or any active variant is
  # "in stock"; a made-to-order piece with no stock is a "preorder".
  def availability(product)
    if product.stock_quantity.to_i.positive? || product.product_variants.active.where("stock_quantity > 0").exists?
      "in stock"
    elsif product.made_to_order?
      "preorder"
    else
      "out of stock"
    end
  end

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
