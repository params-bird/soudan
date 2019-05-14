require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['S3_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['S3_SECRET_ACCESS_KEY'],
    region: ENV['S3_REGION'],
  }
  case Rails.env
  when 'production'
      config.fog_directory  = 'soudan-app'
      config.asset_host = 'https://s3.amazonaws.com/soudan-app'
  end
end

CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/