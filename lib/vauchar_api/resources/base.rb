require "vauchar_api/version"

module VaucharAPI
  class Base < ActiveResource::Base
    @@accepts_attributes = nil

    self.site = "https://api.vauchar.com"
    self.include_format_in_path = false
    self.include_root_in_json = false

    def encode(options = {})
      same = dup
      same.attributes = same.attributes.slice(*@@accepts_attributes) if (@@accepts_attributes)
      same.send("to_#{self.class.format.extension}", options)
    end

    class << self
      def user
        Configuration.merchant_id
      end

      def password
        Configuration.api_key
      end

      def accepts_attributes_for(*attr_names)
        @@accepts_attributes = attr_names
      end
    end
  end
end
