require "httparty"
require "vauchar_api/connection"

p "module ActiveResource"

module ActiveResource
  class Connection
    attr_reader :response

    prepend VaucharAPI::Connection::ResponseCapture
    prepend VaucharAPI::Connection::RequestNotification

    p "module ActiveResource -> Connection"

    def delete_with_body(path, body = "", headers = {})
      with_auth do
        HTTParty.delete("#{site.scheme}://#{site.host}:#{site.port}#{path}", {
          headers: build_request_headers(headers, :delete, self.site.merge(path)),
          body: body,
        })
      end
    end
  end
end
