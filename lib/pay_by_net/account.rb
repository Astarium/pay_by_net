module PayByNet
  class Account
     attr_accessor :id_client, :account, :name, :postal_code, :city, :street, :country, :bank_account

    def initialize(id_client, name, postal_code, city, street, country, bank_account)
      @id_client = id_client
      @bank_account = bank_account
      @name = name
      @postal_code = postal_code
      @city = city
      @street = street
      @country = country
    end

  end
end
