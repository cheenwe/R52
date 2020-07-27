require 'carrierwave'
require 'carrierwave/validations/active_model'

class NullStorage
  attr_reader :uploader

  def initialize(uploader)
    @uploader = uploader
  end

  def identifier
    uploader.filename
  end

  def store!(_file)
    true
  end

  def retrieve!(_identifier)
    true
  end
end

CarrierWave.configure do |config|
  # http://stackoverflow.com/questions/7534341/rails-3-test-fixtures-with-carrierwave/25315883#25315883
  config.storage NullStorage if Rails.env.test?

  if Sy::Config.cfg("storage_in_aliyun") == "1"
    config.storage = :aliyun
    config.aliyun_access_id  = Sy::Config.cfg("aliyun_access_id") #//  = "xxx"
    config.aliyun_access_key = Sy::Config.cfg("aliyun_access_key") #//  == "xxx"
    config.aliyun_bucket     = Sy::Config.cfg("aliyun_bucket") #//  = "chenwei"
    config.aliyun_internal   = Sy::Config.cfg("aliyun_internal") #//  = false
    config.aliyun_area       = Sy::Config.cfg("aliyun_area") #//  = "cn-shanghai"
    config.aliyun_host       = Sy::Config.cfg("aliyun_host") #//  = "https://oss-cn-shanghai.aliyuncs.com"
  else
    config.storage = :file
  end

end
