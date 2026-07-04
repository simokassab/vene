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

  def display_order_price(amount, order)
    return "" if amount.nil?

    currency = order.currency.presence || "USD"
    symbol = ExchangeRateService.symbol_for(currency)
    precision = ExchangeRateService.three_decimal?(currency) ? 3 : 2
    number_to_currency(amount, unit: symbol, precision: precision)
  end

  def payment_method_label(order)
    if order.cod?
      t("orders.payment_cod", default: "Cash on Delivery")
    else
      t("orders.payment_card", default: "Card (MontyPay)")
    end
  end
end
