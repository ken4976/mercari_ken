require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    AWS_ACCESS_KEY_ID: ENV["AWS_ACCESS_KEY_ID"],
    AWS_SECRET_ACCESS_KEY: ENV["AWS_SECRET_ACCESS_KEY"],
    region: 'ap-northeast-1'
  }

  config.fog_directory  = 'ken-text-upload'
  config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/ken-text-upload'
end
