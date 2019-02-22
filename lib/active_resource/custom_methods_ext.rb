module ActiveResource
  class CustomMethods
    def delete(method_name, options = {}, body = nil)
      connection.delete(custom_method_element_url(method_name, options), body, self.class.headers)
    end
  end
end
