require_relative 'test_helper'

describe PayByNet::Payment do 

  before do 
    @date = (Time.now + 1200).strftime('%d-%m-%Y %H:%M:%S')
    astarium = PayByNet::Account.new(1132854509, 'Astarium','00-111','Warszawa','Francuska 23','Polska', 12345678901234567890123456)
    @transaction = PayByNet::Payment.new(astarium, "AABB100100", '49,99', "PLN", "koleo@koleo.pl", 'www.koleo.pl', "www.koleo.pl", "automat", "koleo", @date)
  end
  it 'payment string with data generated correctly' do   
    @transaction.generate_string.must_equal "<id_client>1132854509</id_client><id_trans>AABB100100</id_trans><date_valid>#{@date}</date_valid><amount>49,99</amount><currency>PLN</currency><account>12345678901234567890123456</account><accname>Astarium^NM^00-111^ZP^Warszawa^CI^Francuska 23^ST^Polska^CT^</accname><backpage>www.koleo.pl</backpage><backpagereject>www.koleo.pl</backpagereject>"
  end

  it 'codes properly with base64' do
    coded_transaction = @transaction.generate_payment
    Base64.decode64(coded_transaction).must_equal @transaction.generate_data
  end
end