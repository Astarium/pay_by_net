require 'savon'

require_relative 'pay_by_net/account'
require_relative 'pay_by_net/payment'
require_relative 'pay_by_net/payment_verifier'

puts PayByNet::PaymentVerifier.new("AS00000098").connect
