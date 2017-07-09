class PictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process resize_to_limit: [Settings.post.height, Settings.post.width]

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def default_url
    url = "post/" << [version_name, Settings.post.post_default].compact.join("_")
    ActionController::Base.helpers.asset_path url
  end
end
