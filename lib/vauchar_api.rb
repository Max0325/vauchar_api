require "vauchar_api/configuration"
# require "active_resource"

require "vauchar_api/version"

module VaucharAPI
  def self.config
    yield Configuration
  end
  def self.hello
  end
end

# require "vauchar_api/resources"
