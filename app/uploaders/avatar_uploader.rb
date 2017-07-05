class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process resize_to_limit: [Settings.user.avatar_height, Settings.user.avatar_width]

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def default_url
    url = "avatar/" << [version_name, Settings.user.avatar_default].compact.join("_")
    ActionController::Base.helpers.asset_path url
  end
end
