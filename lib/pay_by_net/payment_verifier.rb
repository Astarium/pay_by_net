module PayByNet
  class PaymentVerifier

    attr_accessor :payment_id, :client_id

    def initialize(payment_id, client_id)
      @payment_id = payment_id
      @client_id = client_id
    end

    def verify
      PayByNet::StatusVerifier.new(status).completed?
    end

    def status
      status_code(response)
    end

    def response
      @client = Savon.client(wsdl: 'https://pbn.paybynet.com.pl/axist/services/PBNTransactionsGetStatus?wsdl')
      @client.call(:get_status_by_payment_id, message: {in0: payment_id,  in1: client_id})
    end

    def status_code(response)
      response.body[:get_status_by_payment_id_response][:get_status_by_payment_id_return].to_i
    end

  end
end
