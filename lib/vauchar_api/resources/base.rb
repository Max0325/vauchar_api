require "vauchar_api/version"

module VaucharAPI
  class Base < ActiveResource::Base
    self.site = "https://api.vauchar.com"
    self.headers["Authorization"] = Base64.encode64("#{Configuration.merchant_id}:#{Configuration.api_key}")
  end
end
