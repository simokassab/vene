# Builds GA4 (Google Analytics 4) ecommerce dataLayer payloads.
#
# Intent events (view_item, add_to_cart, begin_checkout) report base USD prices,
# since product/cart amounts are stored in USD and only converted for display.
# The purchase event reports the order's own currency and the amounts actually
# charged. GA4 converts every event into the property's reporting currency, so
# mixing USD intent events with localized purchase events is fully supported.
module Ga4
  module_function

  # A single GA4 ecommerce "item". Names use English for consistent reporting
  # across locales (the same product otherwise splits into en/ar rows).
  def item(product, variant: nil, quantity: 1, price: nil)
    {
      item_id: product.id.to_s,
      item_name: product.name(:en),
      item_category: product.category&.name(:en),
      item_variant: variant&.display_name,
      price: money(price || product.current_price),
      quantity: quantity.to_i
    }.compact
  end

  # Wraps an event name + ecommerce object for the dataLayer.
  def event(name, currency:, value:, items:, **extra)
    {
      event: name,
      ecommerce: { currency: currency, value: money(value), items: items }.merge(extra.compact)
    }
  end

  def view_item_event(product)
    event("view_item", currency: "USD", value: product.current_price, items: [ item(product) ])
  end

  def add_to_cart_event(product, variant: nil, quantity: 1)
    qty = quantity.to_i
    event(
      "add_to_cart",
      currency: "USD",
      value: product.current_price.to_d * qty,
      items: [ item(product, variant: variant, quantity: qty) ]
    )
  end

  def begin_checkout_event(cart)
    items = cart.items.map { |i| item(i.product, variant: i.product_variant, quantity: i.quantity) }
    event("begin_checkout", currency: "USD", value: cart.subtotal, items: items)
  end

  def purchase_event(order)
    items = order.order_items.includes(:product_variant, product: :category).map do |oi|
      item(oi.product, variant: oi.product_variant, quantity: oi.quantity, price: oi.unit_price)
    end

    event(
      "purchase",
      currency: order.currency.presence || "USD",
      value: order.total_amount,
      items: items,
      transaction_id: order.id.to_s,
      shipping: money(order.shipping_amount),
      tax: money(order.tax_amount),
      coupon: order.coupon_code.presence
    )
  end

  # GA4 accepts floats; round wide enough to keep 3-decimal currencies (e.g. KWD).
  def money(amount)
    amount.to_f.round(3)
  end
end
