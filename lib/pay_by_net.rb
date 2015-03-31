require_relative 'pay_by_net/account'
require_relative 'pay_by_net/payment'


astarium = PayByNet::Account.new(1132854509, 'Astarium','00-111','Warszawa','Francuska 23','Polska', 12345678901234567890123456)
a = PayByNet::Payment.new(astarium, "AAGG100100", '49,99', "PLN", "koleo@koleo.pl", 'www.koleo.pl', "www.koleo.pl", "automat", "koleokoleo", '2015.03.31 15:00:00')
puts a.generate_data
puts a.generate_payment
puts Base64.decode64(a.generate_payment)