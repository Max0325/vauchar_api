require "vauchar_api/version"

module VaucharAPI
  class Base < ActiveResource::Base
    self.site = "https://api.vauchar.com"
    self.include_format_in_path = false
    self.include_root_in_json = false

    def accepts_attributes; nil; end

    def encode(options = {})
      same = dup
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

      def init_prefix(resource)
        init_prefix_explicit(resource.to_s.pluralize, "#{resource}_id")
      end

      def init_prefix_explicit(resource_type, resource_id)
        self.prefix = "/#{resource_type}/:#{resource_id}/"

        define_method resource_id.to_sym do
          @prefix_options[resource_id]
        end
      end
    end

    private

    def keep_prefix_options
      prefix_options = @prefix_options
      yield
      @prefix_options = prefix_options
      self
    end

    def only_id
      encode(only: :id, include: [], methods: [])
    end
  end
end
