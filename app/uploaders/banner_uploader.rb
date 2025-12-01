class BannerUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process resize_to_limit: [2000, 2000]

  version :thumb do
    process resize_to_fill: [600, 400]
  end

  def extension_allowlist
    %w[jpg jpeg png webp]
  end
end
