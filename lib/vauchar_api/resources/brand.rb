module VaucharAPI
  class Brand < Base
    def accepts_attributes
      [:name, :email]
    end
  end
end
