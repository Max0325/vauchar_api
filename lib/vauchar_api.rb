require "vauchar_api/configuration"
require "vauchar_api/version"

require "active_resource"
require "active_resource/formats_ext"

require "vauchar_api/resources"
require "vauchar_api/connection"
require "active_resource/connection_ext"
require "active_resource/custom_methods_ext"

module VaucharAPI
  def self.config
    yield Configuration
  end
end