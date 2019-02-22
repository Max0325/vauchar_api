module VaucharAPI
  class CustomerList < Base
    self.prefix = "/engage/lists/:list_id/"
    self.collection_name = "customers"
  end
end
