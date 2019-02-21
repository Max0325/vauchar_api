module VaucharAPI
  class Brand < Base
    accepts_attributes_for :name, :email
  end
end
