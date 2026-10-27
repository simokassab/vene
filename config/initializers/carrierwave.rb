CarrierWave.configure do |config|
  config.storage = :file
  config.enable_processing = Rails.env.development? || Rails.env.production?
  config.asset_host = ENV.fetch("ASSET_HOST", nil)
  config.cache_dir = Rails.root.join("tmp", "uploads")

  # Keep test uploads out of public/, where they would overwrite development files.
  if Rails.env.test?
    config.root = Rails.root.join("tmp", "test_uploads")
  end

  # Use persistent disk on Render (mounted at /var/data)
  if ENV["RENDER"].present?
    config.root = "/var/data"
  end
end
