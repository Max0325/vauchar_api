module ActiveResource
  class LogSubscriber < ActiveSupport::LogSubscriber
    def request(event)
      p event
      log_request_response_details(event)
      # warn_on_deprecated_header(event)
    end

    def logger
      ActiveResource::Base.logger
    end

    private

    def log_request_response_details(event)
      data = event.payload[:data]
      headers = data.extract_options!
      request_body = data.first

      info "Request:\n#{request_body}" if request_body
      info "Headers: #{headers.inspect}"
      info "Response:\n#{event.payload[:response].body}"
    end
  end
end

ActiveResource::LogSubscriber.attach_to :active_resource
