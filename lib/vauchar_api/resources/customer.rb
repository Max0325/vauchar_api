module VaucharAPI
  # ==== Examples
  #
  #   Create
  #   new_customer = VaucharAPI::Customer.new({
  #     user_id: "12345",
  #     name: "max",
  #     email: "max@gmail.com",
  #     phone: "+886912345678",
  #     birthday: "1990-03-25",
  #   })
  #   new_customer.save
  #
  #   Read
  #   customer = VaucharAPI::Customer.find("cust-15507323535c6e4c416c697")
  #   customers = VaucharAPI::Customer.all
  #
  #   Update
  #   customer = VaucharAPI::Customer.find("cust-15507323535c6e4c416c697")
  #   customer.name = "test update"
  #   customer.save
  #
  #   Delete
  #   customer = VaucharAPI::Customer.find("cust-15507323535c6e4c416c697")
  #   customer.destroy
  #
  #   Redemptions
  #   customer = VaucharAPI::Customer.find("cust-15507323535c6e4c416c697")
  #   result = customer.redemptions("en-deal-15499589715c627f3b57837")
  #   result.voucher.voucher_code # => "DA2C2J65JFVNY"

  class Customer < Base
    def accepts_attributes
      accepts = [:name, :email, :phone, :birthday, :created, :last_seen, :total_purchase]
      accepts.push :user_id if self.new?
      accepts
    end

    def redemptions(deal_id)
      resource = post("deals/#{deal_id}/redemptions", {}, only_id)
      self.class.format.decode(resource.body)
    end
  end
end
