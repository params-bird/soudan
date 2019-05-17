 class ImageUploader < CarrierWave::Uploader::Base
  # リサイズしたり画像形式を変更するのに必要
  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick

  #画像が回転してしまう問題を解消
  process :fix_rotate
  def fix_rotate
    manipulate! do |img|
      img = img.auto_orient
      img = yield(img) if block_given?
      img
    end
  end

  # S3にアップロードする場合
  if Rails.env.development?
    storage :file
  elsif Rails.env.test?
    storage :file
  else
    storage :fog
  end

  # 保存先ーーーーーーーーーーーーーー
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # デフォルト画像は400x400に収まるようリサイズ
  process :resize_to_limit => [400, 400]

  # サムネイル画像
  version :thumb do
    process resize_to_fill: [100, 100]
  end

  # 保存形式をJPGにする
  process :convert => 'png'

# 許可する画像の拡張子
  def extension_whitelist
    %w(jpg jpeg gif png url)
  end
  # 保存するファイルの命名規則
  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  protected
  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end
end