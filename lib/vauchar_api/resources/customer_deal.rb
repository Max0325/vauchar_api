module VaucharAPI
  class CustomerDeal < Base
    init_prefix :customer

    self.collection_name = "deals"
    self.element_name = "deal"
    # def accepts_attributes
    #   [:name, :email, :phone, :birthday, :created, :last_seen, :total_purchase]
    # end
  end
end
