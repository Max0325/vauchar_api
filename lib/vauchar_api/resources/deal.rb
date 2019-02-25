module VaucharAPI
  # ==== Examples
  # deals = VaucharAPI::Deal.all
  # deal = VaucharAPI::Deal.find("en-deal-15499589715c627f3b57837")
  #
  # new_deal = VaucharAPI::Deal.new({
  #   title: "max_test",
  #   brand_id: "brn-15507182295c6e1515a956a",
  #   voucher_data: {
  #     value: "30",
  #     value_unit: "value",
  #     currency: "USD",
  #     expiry_time_type: "relative",
  #     expiry_time: "10",
  #     expiry_time_unit: "hours",
  #   },
  # })
  #
  # VaucharAPI::Deal.find(:all, params: {brand_id: "brn-15507182295c6e1515a956a"})

  class Deal < Base
    self.prefix = "/engage/"

    # def accepts_attributes
    #   [:name, :email]
    # end
  end
end
