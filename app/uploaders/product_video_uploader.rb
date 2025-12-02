class ProductVideoUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_allowlist
    %w[mp4 mov avi webm mkv]
  end

  def content_type_allowlist
    %r{video/}
  end

  def size_range
    0..100.megabytes
  end
end
