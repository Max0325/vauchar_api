module VaucharAPI
  # ==== Examples
  #
  #   Create
  #   new_team = VaucharAPI::Team.new(name: "test by max", email: "max@gmail.com", password: "123456")
  #   new_team.save
  #
  #   Read
  #   team = VaucharAPI::Team.find("DA2C253VYBM")
  #   teams = VaucharAPI::Team.all
  #
  #   Delete
  #   team = VaucharAPI::Team.find("DA2C253VYBM")
  #   team.destroy
  #
  #   Redeem
  #   team = VaucharAPI::Team.find("DA2C253VYBM")
  #   data = { user_id: "2", password: "123456" }
  #   team.redeem(data, params: {voucher_id: "vcr-15524967755c89388793c97"})

  class Team < Base
    def redeem(*args)
      options = args[0]
      params = options.merge(args[1][:params]) if args[1] && args[1][:params]
      resource = post("redeem/vouchers/#{params[:voucher_id]}", {}, options.to_json)
      instantiate_record(format.decode(resource.body), {})
    end
  end
end
