module VaucharAPI
  # ==== Examples
  #
  #   Create
  #   new_list = VaucharAPI::List.new(name: "max list", brand_id: "brn-15507182295c6e1515a956a")
  #   new_list.save
  #
  #   Read
  #   list = VaucharAPI::List.find("list-15508273755c6fbf6fc8ac7")
  #   redemptions = VaucharAPI::DealRedemption.all
  #
  #   Update
  #   list = VaucharAPI::List.find("list-15508273755c6fbf6fc8ac7")
  #   list.name = "Max update"
  #   list.save
  #
  #   Delete
  #   list = VaucharAPI::List.find("list-15508273755c6fbf6fc8ac7")
  #   list.destroy
  #
  #   Customers
  #   list = VaucharAPI::List.find("list-15502036875c663b27600fe")
  #   list.get(:customers);
  #
  #   Add Customers
  #   list = VaucharAPI::List.find("list-15502036875c663b27600fe")
  #   list.post(:customers, {}, {customers: ["cust-15508280955c6fc23f7f807", "cust-15507323535c6e4c416c697"]}.to_json)
  #
  #   Delete Customers
  #   list = VaucharAPI::List.find("list-15502036875c663b27600fe")
  #   list.delete(:customers, {}, {customers: ["cust-15508280955c6fc23f7f807", "cust-15507323535c6e4c416c697"]})
  #
  #   Find By Brand
  #   lists = VaucharAPI::List.find(:all, params: {brand_id: "brn-15507182295c6e1515a956a"})

  class DealRedemption < Base
    self.prefix = "/engage/"
    self.element_name = "deals/redemptions"

    def redemption_id
      # self.prefix = ""
      resource = get("vouchers/#{self.voucher_id}/redemptions", {})
      self.class.format.decode(resource.body)
    end

    def destroy
      resource = delete("vouchers/#{self.voucher_id}/redemptions/#{}", {}, only_id)
      self.class.format.decode(resource.body)
    end
  end
end
