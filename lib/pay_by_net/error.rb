module PayByNet
  class Error < StandardError
  end

  class InvalidTransactionId < Error
    def initialize(length)
      @length = length
    end

    def message
      "transaction_id is #{@length}, but should be 10"
    end
  end

  class InvalidPassword < Error
    def initialize(length)
      @length = length
    end

    def message
      "password length is #{@length}, but should between 8 and 40"
    end
  end
end
