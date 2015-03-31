require 'digest'

module PayByNet
  class Payment
    # attr_accessor :id_client, :id_trans, :date_valid, :amount, :currency, :email, :account, :accname, :backpage, :backpagereject, automat:

    def initialize(account, id_trans, amount, currency, email, backpage, backpagereject, automat, password, *date_valid)
      @date_valid = date_valid[0] ||(Time.now + 900).strftime('%d-%m-%Y %H:%M:%S')
      @id_client = account.id_client
      @id_trans = id_trans
      @amount = amount
      @currency = currency
      @email = email
      @account = account.bank_account
      @name = account.name
      @postal_code = account.postal_code 
      @city = account.city
      @street = account.street
      @country = account.country
      @backpage = backpage
      @backpagereject = backpagereject
      @automat = automat
      @password = password
    end

    def generate_string
      client +
      transaction +
      date +
      amount +
      currency +
      account + 
      accname + 
      backpage + 
      backpagereject
      
    end

    def generate_data
      generate_string + hash
    end


    def client
      "<id_client>" + @id_client.to_s + "</id_client>"
    end

    def transaction
      "<id_trans>" + @id_trans + "</id_trans>"
    end

    def date
      "<date_valid>" + @date_valid.to_s + "</date_valid>"
    end

    def amount
      "<amount>" + @amount + "</amount>"
    end

    def currency
      "<currency>" + @currency + "</currency>"
    end

    def account
      "<account>" + @account.to_s + "</account>"
    end

     def accname
      "<accname>" + @name + "^NM^" + @postal_code + "^ZP^" + @city + "^CI^" + @street +"^ST^" + @country + "^CT^</accname>"
    end

     def backpage
      "<backpage>" + @backpage + "</backpage>"
    end

    def backpagereject
      "<backpagereject>" + @backpagereject + "</backpagereject>"
    end 

    def password
      "<password>" + @password + "</password>"
    end

    def hash_data
      string = generate_string + password
      return Digest::SHA1.hexdigest(string)
    end 

    def hash
      "<hash>" + hash_data + "</hash>"
    end
  end
end