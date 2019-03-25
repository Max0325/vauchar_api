module VaucharAPI
  class VoucherRedemption < Base
    self.element_name = "vouchers"

    def self.redemptions(params)
      p "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
      resource = get("#{params[:voucher_id]}/redemptions", {})
      data = resource
      p "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
      p data
    end
  end
end