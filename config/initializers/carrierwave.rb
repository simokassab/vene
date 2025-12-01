CarrierWave.configure do |config|
  config.storage = :file
  config.enable_processing = Rails.env.development? || Rails.env.production?
  config.asset_host = ENV.fetch("ASSET_HOST", nil)
  config.cache_dir = Rails.root.join("tmp", "uploads")
end
