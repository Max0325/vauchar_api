module VaucharAPI
  class List < Base
    self.prefix = "/engage/"

    def accepts_attributes
      [:name, :brand_id]
    end
  end
end
