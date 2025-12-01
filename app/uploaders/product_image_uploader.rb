class ProductImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process resize_to_limit: [1600, 1600]

  version :medium do
    process resize_to_limit: [800, 800]
  end

  version :thumb do
    process resize_to_fill: [300, 300]
  end

  def extension_allowlist
    %w[jpg jpeg png webp]
  end
end
