require "digest"
require "base64"
require "time"

module PayByNet
  class Payment

    def initialize(company, id_trans, amount, currency, email, backpage, backpagereject, automat, password, date_valid = Time.now + 900)
      @date_valid = parse_date(date_valid)
      @id_trans = id_trans
      @amount = amount
      @currency = currency
      @email = email
      @company = company
      @backpage = backpage
      @backpagereject = backpagereject
      @automat = automat
      @password = password
      validate_data
    end

    def validate_data
      validate_date
      validate_id_trans
      validate_password
    end

    def validate_id_trans
      if @id_trans.length != 10
        raise InvalidTransactionId.new(@id_trans.length)
      end
    end

    def validate_password
      if @password.length < 8 || @password.length > 40
        raise "Your password is not valid"
      end
    end

    def validate_date
      if @date_valid < Time.now + 900 || @date_valid > Time.now + 604800
        raise "Your date is not valid"
      end
    end

    def parse_date(date)
      if date.class == Time
        date
      else
        Time.parse(date)
      end
    end

    def generate_payment
      Base64.strict_encode64(generate_data)
    end

    def generate_data
      generate_string + hash
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

    def client
      "<id_client>" + @company.id_client + "</id_client>"
    end

    def transaction
      "<id_trans>" + @id_trans + "</id_trans>"
    end

    def date
      "<date_valid>" + @date_valid.strftime("%d-%m-%Y %H:%M:%S") + "</date_valid>"
    end

    def amount
      "<amount>" + @amount + "</amount>"
    end

    def currency
      "<currency>" + @currency + "</currency>"
    end

    def account
      "<account>" + @company.bank_account+ "</account>"
    end

     def accname
      "<accname>" + @company.name + "^NM^" + @company.postal_code + "^ZP^" + @company.city + "^CI^" + @company.street + "^ST^" + @company.country + "^CT^</accname>"
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
