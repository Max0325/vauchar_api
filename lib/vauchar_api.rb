require "vauchar_api/configuration"
require "vauchar_api/version"

require "active_resource"
require "active_resource/formats_ext"
require "active_resource/custom_methods_ext"

module VaucharAPI
  def self.config
    yield Configuration
  end
end

require "vauchar_api/resources"
require "vauchar_api/connection"

if VaucharAPI::Base.respond_to?(:connection_class)
  VaucharAPI::Base.connection_class = VaucharAPI::Connection
else
  require 'active_resource/connection_ext'
end