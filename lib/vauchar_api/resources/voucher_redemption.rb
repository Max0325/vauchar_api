module VaucharAPI
  class VoucherRedemption < Base
    self.prefix = "/vouchers/"

    def self.find(*args)
      options = { :refund => args[0] }
      params = {}
      params = args[1][:params] if args[1] && args[1][:params]

      resource = post(":voucher_id/redemptions", params, options.to_json)
      instantiate_record(format.decode(resource.body), {})
    end
  end
end