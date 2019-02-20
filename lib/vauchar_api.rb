require "active_resource"
require "vauchar_api/configuration"
require "active_resource"

require "vauchar_api/version"

module VaucharAPI
  def self.config
    yield Configuration
  end
  def self.init
    VaucharAPI.config do |config|
      config.merchant_id = "da2c250b-c417-42d8-936e-9bc4c246f90e"
      config.api_key = "8d12f7f6c8a8fe505fc20b2cee6c71fc"
    end
  end
end

require "vauchar_api/resources"
