require "active_resource"
require "active_resource/formats_ext"

require "vauchar_api/configuration"
require "vauchar_api/version"
p "require vauchar_api/version"

module VaucharAPI
  def self.config
    yield Configuration
  end
end

require "vauchar_api/resources"
require "vauchar_api/connection"

require "active_resource/connection_ext"
p "require active_resource/connection_ext"

t = VaucharAPI::Connection.new("https://api.vauchar.com", {})
p t.methods
p t.methods.grep(/delete/)

require "active_resource/custom_methods_ext"

p "VaucharAPI::Base.respond_to?(:connection_class)"
p VaucharAPI::Base.respond_to?(:connection_class)

VaucharAPI::Base.connection_class = VaucharAPI::Connection
p "VaucharAPI::Base.connection_class = VaucharAPI::Connection"
