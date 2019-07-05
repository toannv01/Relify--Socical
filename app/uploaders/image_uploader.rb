# frozen_string_literal: true

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def cache_dir
    '/tmp/projectname-cache'
  end
  
  def extension_whitelist
    %w[jpg jpeg gif png]
  end

  process resize_to_fit: [860, 500]

  version :thumb do
    process resize_to_fit: [640, 400]
  end

  version :cover_image do
    process resize_to_fit: [860, 640]
  end

  version :avartar do
    process :resize_to_fit => [200, 50]
  end
  
  def content_type_whitelist
    /image\//
  end
end
