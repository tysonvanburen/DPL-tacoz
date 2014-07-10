class MenuItemPictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  version :large do
    process resize_to_fill: [640, 640]
  end

  version :small do
    process resize_to_fill: [350, 350]
  end

  version :thumb do
    process resize_to_fill: [80, 80]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    ActionController::Base.helpers.asset_path("default_#{version_name}.jpg")
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
