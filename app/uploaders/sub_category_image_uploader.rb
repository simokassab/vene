class SubCategoryImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Standard size for mega menu
  process resize_to_limit: [800, 600]

  # Thumbnail for admin lists
  version :thumb do
    process resize_to_fill: [200, 150]
  end

  # Square version for mega menu cards
  version :mega_menu do
    process resize_to_fill: [300, 300]
  end

  def extension_allowlist
    %w[jpg jpeg png webp]
  end
end
