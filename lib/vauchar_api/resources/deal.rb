module VaucharAPI
  # ==== Examples
  #
  #   Create
  #   new_deal = VaucharAPI::Deal.new({
  #     title: "max_test",
  #     brand_id: "brn-15507182295c6e1515a956a",
  #     voucher_data: {
  #       value: "30",
  #       value_unit: "value",
  #       currency: "USD",
  #       expiry_time_type: "relative",
  #       expiry_time: "10",
  #       expiry_time_unit: "hours",
  #     },
  #   })
  #   new_deal.save
  #
  #   Read
  #   deal = VaucharAPI::Deal.find("en-deal-15499589715c627f3b57837")
  #   deals = VaucharAPI::Deal.all
  #
  #   Delete
  #   deal = VaucharAPI::Deal.find("en-deal-15499589715c627f3b57837")
  #   deal.destroy
  #
  #   Find By Brand
  #   deals = VaucharAPI::Deal.find(:all, params: {brand_id: "brn-15507182295c6e1515a956a"})

  class Deal < Base
    self.prefix = "/engage/"

    def accepts_attributes
      [
        :title,
        :start_time,
        :expiry_time,
        :redemptions_per_user_limit,
        :redemption_per_user_time_limit_unit,
        :brand_id,
        :terms,
      ]
    end
  end
end
