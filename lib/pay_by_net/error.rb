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
end
