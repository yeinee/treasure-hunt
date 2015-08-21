CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAIOPFNCF6O5Z5VLWQ',                        # required
    aws_secret_access_key: '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',                        # required
    region:                'ap-northeast-1'                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'insu-bucket'                          # required
  # config.fog_public     = false                                        # optional, defaults to true
  # config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end