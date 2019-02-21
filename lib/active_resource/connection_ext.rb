require "vauchar_api/connection"

module ActiveResource
  class Connection
    attr_reader :response

    prepend VaucharAPI::Connection::ResponseCapture
    prepend VaucharAPI::Connection::RequestNotification
  end
end
