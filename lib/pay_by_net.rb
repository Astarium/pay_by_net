require 'savon'
require 'rest-client'

require_relative 'pay_by_net/error'
require_relative 'pay_by_net/account'
require_relative 'pay_by_net/payment'
require_relative 'pay_by_net/payment_verifier'
require_relative 'pay_by_net/status_verifier'
require_relative 'pay_by_net/bank_loader'
require_relative 'pay_by_net/bank'

module PayByNet

  class << self
    attr_accessor :test_mode, :verification_wsdl
  end

  def self.setup(&block)
    yield self
    self.verification_wsdl = (self.test_mode ? 'https://pbn.paybynet.com.pl/axist/services/PBNTransactionsGetStatus?wsdl' : 'https://pbn.paybynet.com.pl/axis/services/PBNTransactionsGetStatus?wsdl')
  end
end
