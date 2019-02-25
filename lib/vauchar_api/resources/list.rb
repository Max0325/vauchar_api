module VaucharAPI
  class List < Base
    self.prefix = "/engage/"
    has_many :customers

    def accepts_attributes
      [:name, :brand_id]
    end

    # ==== Examples
    # list = VaucharAPI::List.find("list-15502036875c663b27600fe")
    # list.post(:customers, {}, {customers: ["cust-15508280955c6fc23f7f807", "cust-15507323535c6e4c416c697"]}.to_json)
    # list.delete(:customers, {}, {customers: ["cust-15508280955c6fc23f7f807", "cust-15507323535c6e4c416c697"]})
  end
end
