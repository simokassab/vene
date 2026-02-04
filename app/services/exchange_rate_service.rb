class ExchangeRateService
  CACHE_KEY = "exchange_rates_from_usd".freeze
  CACHE_TTL = 6.hours

  # Pegged Gulf rates (these rarely change)
  FALLBACK_RATES = {
    "USD" => 1.0,
    "SAR" => 3.75,
    "AED" => 3.67,
    "KWD" => 0.31,
    "BHD" => 0.38,
    "OMR" => 0.38,
    "QAR" => 3.64
  }.freeze

  CURRENCY_SYMBOLS = {
    "USD" => "$ ",
    "SAR" => "SAR ",
    "AED" => "AED ",
    "KWD" => "KWD ",
    "BHD" => "BHD ",
    "OMR" => "OMR ",
    "QAR" => "QAR "
  }.freeze

  THREE_DECIMAL_CURRENCIES = %w[BHD KWD OMR].freeze

  def self.rate_for(currency_code)
    return 1.0 if currency_code == "USD"

    cached_rates = Rails.cache.read(CACHE_KEY)
    if cached_rates && cached_rates[currency_code]
      return cached_rates[currency_code].to_f
    end

    FALLBACK_RATES.fetch(currency_code, 1.0)
  end

  def self.symbol_for(currency_code)
    CURRENCY_SYMBOLS.fetch(currency_code, "#{currency_code} ")
  end

  def self.three_decimal?(currency_code)
    THREE_DECIMAL_CURRENCIES.include?(currency_code)
  end

  def self.refresh_rates!
    uri = URI("https://open.er-api.com/v6/latest/USD")
    response = Net::HTTP.get_response(uri)

    if response.is_a?(Net::HTTPSuccess)
      data = JSON.parse(response.body)
      if data["result"] == "success" && data["rates"]
        Rails.cache.write(CACHE_KEY, data["rates"], expires_in: CACHE_TTL)
        Rails.logger.info("ExchangeRateService: rates refreshed successfully")
        return true
      end
    end

    Rails.logger.warn("ExchangeRateService: failed to refresh rates (HTTP #{response.code})")
    false
  rescue StandardError => e
    Rails.logger.error("ExchangeRateService: #{e.message}")
    false
  end
end
