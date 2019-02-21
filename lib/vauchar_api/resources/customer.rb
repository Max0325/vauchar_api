module VaucharAPI
  class Customer < Base
    def accepts_attributes
      [:name, :email, :phone, :birthday, :created, :last_seen, :total_purchase]
    end
  end
end
