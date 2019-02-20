require "vauchar_api/version"

module VaucharAPI
  class Base < ActiveResource::Base
    cattr_accessor :static_headers
    self.static_headers = headers
    self.site = "https://api.vauchar.com"
    # self.include_format_in_path = false
    # self.include_root_in_json = false

    class << self
      def element_path(id, prefix_options = {}, query_options = nil)
        prefix_options, query_options = split_options(prefix_options) if query_options.nil?
        "#{prefix(prefix_options)}#{collection_name}/#{URI.parser.escape id.to_s}#{query_string(query_options)}"
      end

      # def user
      #   Configuration.merchant_id
      # end

      # def password
      #   Configuration.api_key
      # end

      def headers
        @headers = static_headers.clone
        @headers["Authorization"] = api_token
        @headers
      end

      def api_token
        token = Base64.strict_encode64 "#{Configuration.merchant_id}:#{Configuration.api_key}"
        "Basic #{token}"
      end

      # def init_prefix(resource)
      #   init_prefix_explicit(resource.to_s.pluralize, "#{resource}_id")
      # end

      # def init_prefix_explicit(resource_type, resource_id)
      #   self.prefix = "/admin/#{resource_type}/:#{resource_id}/"
      #   p self.prefix
      #   define_method resource_id.to_sym do
      #     @prefix_options[resource_id]
      #   end
      # end
    end
  end
end
