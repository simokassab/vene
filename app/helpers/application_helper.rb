module ApplicationHelper
  include Pagy::Frontend

  def display_price(amount_usd)
    return "" if amount_usd.nil?

    currency = visitor_currency
    if currency == "USD"
      number_to_currency(amount_usd, unit: "$ ")
    else
      rate = ExchangeRateService.rate_for(currency)
      converted = amount_usd * rate
      symbol = ExchangeRateService.symbol_for(currency)
      precision = ExchangeRateService.three_decimal?(currency) ? 3 : 2
      number_to_currency(converted, unit: symbol, precision: precision)
    end
  end

  # Builds the wa.me deep link for a made-to-order enquiry. This is the single place the
  # link is constructed; every call site goes through it.
  #
  # Returns nil when no number is configured, so callers can degrade instead of emitting
  # https://wa.me/?text=... which opens WhatsApp with no recipient.
  def made_to_order_whatsapp_url(product, variant: nil, url: nil)
    number = current_settings.whatsapp_phone_number.to_s.gsub(/[^0-9]/, "")
    return nil if number.blank?

    key = variant ? "products.made_to_order_whatsapp_message_variant" : "products.made_to_order_whatsapp_message"
    # current_price, not price: quoting the pre-sale figure contradicts the page the buyer
    # is looking at. display_price converts to the visitor's selected currency for the same reason.
    text = t(key,
             product: product.name(I18n.locale),
             variant: variant&.display_name,
             price: display_price(product.current_price),
             url: url || product_url(product.slug, locale: I18n.locale))

    "https://wa.me/#{number}?text=#{ERB::Util.url_encode(text)}"
  end

  def display_order_price(amount, order)
    return "" if amount.nil?

    currency = order.currency.presence || "USD"
    symbol = ExchangeRateService.symbol_for(currency)
    precision = ExchangeRateService.three_decimal?(currency) ? 3 : 2
    number_to_currency(amount, unit: symbol, precision: precision)
  end

  def payment_method_label(_order)
    t("orders.payment_card", default: "Card (MontyPay)")
  end
end
