require "vauchar_api/connection"

module ActiveResource
  class Connection
    attr_reader :response

    prepend VaucharAPI::Connection::ResponseCapture
    prepend VaucharAPI::Connection::RequestNotification

    def delete_with_body(path, body = "", headers = {})
      with_auth { request(:delete, path, body.to_s, build_request_headers(headers, :post, self.site.merge(path))) }
    end
  end
end
