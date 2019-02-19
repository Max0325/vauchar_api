module VaucharAPI
  class Configuration
    class << self
      attr_accessor :merchant_id,
                    :api_key
    end
  end
end
