CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAJGNK4H2X2NGCDI6Q',                        # required
    :aws_secret_access_key  => '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',                        # required
    
    #:region                 => 'us-west-1',                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'heroswall'                     # required
end