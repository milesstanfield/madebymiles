# encoding: utf-8

class FileUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :desktop do
    process :resize_to_fill => [1100, 624, 'North']
  end

  version :tablet do
    process :resize_to_fill => [720, 405, 'North']
  end

  version :mobile do
    process :resize_to_fill => [400, 225, 'North']
  end
end
