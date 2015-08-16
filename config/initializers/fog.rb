CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAJZY6K5HDA4RSDYZQ',                        # required
    aws_secret_access_key: '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',                        # required
    region:                'ap-northeast-1'                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'y-treasure-hunt'                          # required
  # config.fog_public     = false                                        # optional, defaults to true
  # config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end