module VaucharAPI
  class Connection < ActiveResource::Connection
    attr_reader :response

    def delete_with_body(path, body = "", headers = {})
      with_auth do
        HTTParty.delete("#{site.scheme}://#{site.host}:#{site.port}#{path}", {
          headers: build_request_headers(headers, :delete, self.site.merge(path)),
          body: body,
        })
      end
    end

    module ResponseCapture
      def handle_response(response)
        @response = super
      end
    end

    include ResponseCapture

    module RequestNotification
      def request(method, path, *arguments)
        super.tap do |response|
          notify_about_request(method, path, response, arguments)
        end
      rescue => e
        notify_about_request(method, path, e.response, arguments) if e.respond_to?(:response)
        raise
      end

      def notify_about_request(method, path, response, arguments)
        ActiveSupport::Notifications.instrument("request.active_resource_detailed") do |payload|
          payload[:method] = method
          payload[:path] = path
          payload[:response] = response
          payload[:data] = arguments
          p payload
        end
      end
    end

    include RequestNotification
  end
end
