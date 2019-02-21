module ActiveResource
  module Formats
    def self.remove_root(data)
      data = data.with_indifferent_access
      data = data.key?(:data) ? data[:data] : data
      p "ActiveResource::Formats"
      p data
      if data.is_a?(Hash) && data.keys.size == 1 && data.values.first.is_a?(Enumerable)
        data.values.first
      else
        data
      end
    end
  end
end
