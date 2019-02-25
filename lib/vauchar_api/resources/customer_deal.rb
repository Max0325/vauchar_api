module VaucharAPI
  # ==== Examples
  # [Read]
  # deals = VaucharAPI::CustomerDeal.find(:all, params: {customer_id: "cust-15507323535c6e4c416c697"})
  #
  # [Redemptions]
  # deals[1].redemptions
  # deals[1].voucher.voucher_code # => "DA2C2J65JFVNY"
  #
  # [Validate]
  # deals[1].validate

  class CustomerDeal < Base
    init_prefix :customer
    self.collection_name = "deals"

    def customer_id
      @prefix_options[:customer_id]
    end

    def id
      self.data.id
    end

    def redemptions
      keep_prefix_options do
        resource = post(:redemptions, {}, only_id)
        data = self.class.format.decode(resource.body)
        load({voucher: data}, false, true)
      end
    end

    def validate
      keep_prefix_options do
        resource = get(:validate, {})
        load({data: resource}, false, true)
      end
    end

    # ==== Examples
    # voucher = VaucharAPI::CustomerDeal.redemptions(
    #   {},
    #   params: {
    #     customer_id: "cust-15507323535c6e4c416c697",
    #     id: "en-deal-15499589715c627f3b57837",
    #   },
    # )
    #
    # def self.redemptions(*args)
    #   options = {:refund => args[0]}
    #   params = options.merge(args[1][:params]) if args[1] && args[1][:params]
    #   self.prefix = "/customers/#{params[:customer_id]}/"
    #   resource = post("#{params[:id]}/redemptions", {}, options.to_json)
    #   instantiate_record(format.decode(resource.body), {})
    # end
  end
end
