require 'digest'

# module PayByNet
  class Payment
    # attr_accessor :id_client, :id_trans, :date_valid, :amount, :currency, :email, :account, :accname, :backpage, :backpagereject, automat:

    def initialize(id_client, id_trans, amount, currency, email, account, accname, backpage, backpagereject, automat, password, *date_valid)
      @date_valid = date_valid[0] ||(Time.now + 900).strftime('%Y-%m-%d %H:%M:%S')
      @id_client = id_client
      @id_trans = id_trans
      @amount = amount
      @currency = currency
      @email = email
      @account = account
      @accname = accname
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
      "<id_trans>" + @amount + "</id_trans>"
    end

    def currency
      "<currency>" + @currency + "</currency>"
    end

    def account
      "<account>" + @account.to_s + "</account>"
    end

     def accname
      "<accname>" + @accname + "</accname>"
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
# end
#  Digest::SHA1.hexdigest

a = Payment.new(1132854509, "AA100100", '49,99', "PLN", "koleo@koleo.pl", 12345678901234567890123456, 'Astarium', 'www.koleo.pl', "www.koleo.pl", "automat", "koleo")
puts a.generate_data