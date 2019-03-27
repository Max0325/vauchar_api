require "active_resource"
require "active_resource/formats_ext"
require "active_resource/connection_ext"
require "active_resource/custom_methods_ext"

require "vauchar_api/configuration"
require "vauchar_api/version"

module VaucharAPI
  def self.config
    yield Configuration
  end
end

require "vauchar_api/resources"
require "vauchar_api/connection"

VaucharAPI::Base.connection_class = VaucharAPI::Connection
