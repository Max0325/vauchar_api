module VaucharAPI
  # redemption = VaucharAPI::VoucherRedemption.find({voucher_id: "vcr-15533454515c962bab95e5b"})
  # redemption[:id]
  class VoucherRedemption < Base
    self.element_name = "vouchers"

    def self.find(params)
      resource = get("#{params[:voucher_id]}/redemptions", {})
      resource.first.with_indifferent_access
    end

    def self.destroy(params)
      begin 
        redemption = VaucharAPI::VoucherRedemption.find({voucher_id: params[:voucher_id]})
        p redemption[:id]
        resource = delete("#{params[:voucher_id]}/redemptions/#{redemption[:id]}")
      rescue
        p "destroy fail!!"
      end
    end
  end
end