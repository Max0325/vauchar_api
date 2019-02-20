require "vauchar_api/version"

module VaucharAPI
  class Base < ActiveResource::Base
    self.site = "https://api.vauchar.com"

    class << self
      def headers
        @headers ||= {}
        @headers["Authorization"] = api_token
        @headers
      end

      def api_token
        Base64.encode64 "#{Configuration.merchant_id}:#{Configuration.api_key}"
      end
    end
  end
end
