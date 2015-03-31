module PayByNet
  class Account
    attr_accessor :id_client, :account, :name, :postal_code, :city, :street, :country, :bank_account

    def initialize(id_client, name, postal_code, city, street, country, bank_account)
      @id_client = id_client.to_s
      @bank_account = bank_account.to_s
      @name = name
      @postal_code = postal_code
      @city = city
      @street = street
      @country = country
      validate_data
    end

    def validate_data
      validate_id
      validate_bank_account
    end

    def validate_id
      if @id_client.length != 10 && @id_client.length != 11
        raise "Your id is not proper length"
      end
    end

    def validate_bank_account
      if @bank_account.length != 26 
        raise "Your bank account is not proper length"
      end
    end

  end
end
