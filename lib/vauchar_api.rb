require "http_logger"
require "vauchar_api/configuration"
require "active_resource"

require "vauchar_api/version"

HttpLogger.log_request_body = true

module VaucharAPI
  def self.config
    yield Configuration
  end
end

require "vauchar_api/resources"

ActiveSupport::Notifications.subscribe("request.active_resource") do |name, start, finish, id, payload|
  p payload
end

VaucharAPI.config do |config|
  config.merchant_id = "da2c250b-c417-42d8-936e-9bc4c246f90e"
  config.api_key = "8d12f7f6c8a8fe505fc20b2cee6c71fc"
end
