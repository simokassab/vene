Geocoder.configure(
  lookup: :ipinfo_io,
  timeout: 3,
  cache: Rails.cache,
  cache_options: { expires_in: 48.hours }
)
