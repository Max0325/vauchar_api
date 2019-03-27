require "active_resource/connection_ext"

module ActiveResource
  module CustomMethods
    def delete(method_name, options = {}, body = nil)
      if body.blank?
        connection.delete(custom_method_element_url(method_name, options), self.class.headers)
      else
        connection.delete_with_body(custom_method_element_url(method_name, options), body, self.class.headers)
      end
    end
  end
end
