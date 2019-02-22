module VaucharAPI
  class CustomerList < Base
    init_prefix :list
    self.collection_name = "customers"
  end
end
