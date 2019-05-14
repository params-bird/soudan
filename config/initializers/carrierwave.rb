require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test?
    config.storage = :file
  elsif Rails.env.production?
    CarrierWave.configure do |config|
      config.cache_dir = "#{Rails.root}/tmp/uploads"
      config.fog_provider = 'fog'
      config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['S3_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['S3_SECRET_ACCESS_KEY'],
      region: 'ap-northeast-1'
      }
      config.fog_directory  = 'soudan-sns'
      config.asset_host = 'https://s3.amazonaws.com/soudan-sns'
    end
  end
end