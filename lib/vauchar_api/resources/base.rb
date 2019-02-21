require "vauchar_api/version"

module VaucharAPI
  class Base < ActiveResource::Base
    self.site = "https://api.vauchar.com"
    self.include_format_in_path = false
    self.include_root_in_json = false

    def accepts_attributes
      nil
    end

    def encode(options = {})
      same = dup
      p accepts_attributes
      same.attributes = same.attributes.slice(*accepts_attributes) if (accepts_attributes)
      same.send("to_#{self.class.format.extension}", options)
    end

    class << self
      def user
        Configuration.merchant_id
      end

      def password
        Configuration.api_key
      end
    end
  end
end
