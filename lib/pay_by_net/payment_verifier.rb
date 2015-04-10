module PayByNet
  class PaymentVerifier

    attr_accessor :payment_id

    def initialize(payment_id)
      @payment_id = payment_id
    end

    def verify
      completed?(connect)
    end

    def connect
      @client = Savon.client(wsdl: 'https://pbn.paybynet.com.pl/axist/services/PBNTransactionsGetStatus?wsdl')
      response =@client.call(:get_status_by_payment_id, message: {in0: payment_id,  in1: "1132854509"})
      status_code(response)
    end

    def status_code(response)
      response.body[:get_status_by_payment_id_response][:get_status_by_payment_id_return].to_i
    end
    def completed?(response)
     [2203, 2303].include?(response)
    end

    def rejected?(response)
      [2202, 2302].include?(response)
    end

    def outdated?(response)
      [2201, 2301].include?(response)
    end

  end
end