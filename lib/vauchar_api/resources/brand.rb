module VaucharAPI
  # ==== Examples
  #
  #   Create
  #   new_brand = VaucharAPI::Brand.new(name: "test by max", email: "max@gmail.com")
  #   new_brand.save
  #
  #   Read
  #   brand = VaucharAPI::Brand.find("brn-15510817645c73a12406a95")
  #   brands = VaucharAPI::Brand.all
  #
  #   Update
  #   brand = VaucharAPI::Brand.find("brn-15510817645c73a12406a95")
  #   brand.name = "test update"
  #   brand.save
  #
  #   Delete
  #   brand = VaucharAPI::Brand.find("brn-15510817645c73a12406a95")
  #   brand.destroy

  class Brand < Base
    def accepts_attributes
      [:name, :email]
    end
  end
end
