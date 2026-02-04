class GeolocationService
  GULF_CURRENCIES = {
    "SA" => "SAR",
    "AE" => "AED",
    "KW" => "KWD",
    "BH" => "BHD",
    "OM" => "OMR",
    "QA" => "QAR"
  }.freeze

  COUNTRY_FLAGS = {
    "SA" => "\u{1F1F8}\u{1F1E6}",
    "AE" => "\u{1F1E6}\u{1F1EA}",
    "KW" => "\u{1F1F0}\u{1F1FC}",
    "BH" => "\u{1F1E7}\u{1F1ED}",
    "OM" => "\u{1F1F4}\u{1F1F2}",
    "QA" => "\u{1F1F6}\u{1F1E6}"
  }.freeze

  DEFAULT_FLAG = "\u{1F310}".freeze

  # All supported currencies for the dropdown (USD + Gulf)
  CURRENCY_OPTIONS = [
    { code: "USD", flag: "\u{1F1FA}\u{1F1F8}", label: "USD" },
    { code: "SAR", flag: "\u{1F1F8}\u{1F1E6}", label: "SAR" },
    { code: "AED", flag: "\u{1F1E6}\u{1F1EA}", label: "AED" },
    { code: "KWD", flag: "\u{1F1F0}\u{1F1FC}", label: "KWD" },
    { code: "BHD", flag: "\u{1F1E7}\u{1F1ED}", label: "BHD" },
    { code: "OMR", flag: "\u{1F1F4}\u{1F1F2}", label: "OMR" },
    { code: "QAR", flag: "\u{1F1F6}\u{1F1E6}", label: "QAR" }
  ].freeze

  SUPPORTED_CURRENCIES = CURRENCY_OPTIONS.map { |c| c[:code] }.freeze

  CURRENCY_FLAG_MAP = CURRENCY_OPTIONS.each_with_object({}) { |c, h| h[c[:code]] = c[:flag] }.freeze

  def self.detect(ip_address)
    return default_result if ip_address.blank? || ip_address == "127.0.0.1" || ip_address == "::1"

    result = Geocoder.search(ip_address).first
    return default_result unless result

    country_code = result.country_code&.upcase
    currency = GULF_CURRENCIES.fetch(country_code, "USD")
    flag = COUNTRY_FLAGS.fetch(country_code, DEFAULT_FLAG)

    { country_code: country_code, currency: currency, flag: flag }
  rescue StandardError => e
    Rails.logger.warn("GeolocationService error: #{e.message}")
    default_result
  end

  def self.default_result
    { country_code: nil, currency: "USD", flag: DEFAULT_FLAG }
  end
end
