module VaucharAPI
  # ==== Examples
  # [Create]
  # new_customer = VaucharAPI::Customer.new({
  #   user_id: "12345",
  #   name: "max",
  #   email: "max@gmail.com",
  #   phone: "+886912345678",
  #   birthday: "1990-03-25",
  # })
  # new_customer.save
  #
  # [Read]
  # customer = VaucharAPI::Customer.find("cust-15507323535c6e4c416c697")
  # customers = VaucharAPI::Customer.all
  #
  # [Update]
  # customer = VaucharAPI::Customer.find("cust-15507323535c6e4c416c697")
  # customer.name = "test update"
  # customer.save
  #
  # [Delete]
  # customer = VaucharAPI::Customer.find("cust-15507323535c6e4c416c697")
  # customer.destroy

  class Customer < Base
    def accepts_attributes
      accepts = [:name, :email, :phone, :birthday, :created, :last_seen, :total_purchase]
      accepts.push :user_id if self.new?
      accepts
    end
  end
end
