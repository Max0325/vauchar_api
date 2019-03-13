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

  class Team < Base
    def redeem(voucher_id)
      keep_prefix_options do
        resource = post("redeem/vouchers/#{voucher_id}", {}, only_id)
        self.class.format.decode(resource.body)
      end
    end
  end
end
