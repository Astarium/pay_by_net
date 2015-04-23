require_relative 'test_helper'

describe PayByNet::Payment do 

  before do 
    new_time = Time.local(2015, 4, 13, 12, 0, 0)
    Timecop.freeze(new_time)
    @date = "14-04-2015 12:00:00"
    @astarium = PayByNet::Account.new(1132854509, 'Astarium','00-111','Warszawa','Francuska 23','Polska',  44114020040000310215823843)
    @transaction = PayByNet::Payment.new(@astarium, "AABB100100", '49,99', "PLN", "koleo@koleo.pl", 'www.koleo.pl', "www.koleo.pl", "automat", "koleokoleo", @date)
  end

  it 'payment string with data generated correctly' do 
    @transaction.generate_string.must_equal "<id_client>1132854509</id_client><id_trans>AABB100100</id_trans><date_valid>#{@date}</date_valid><amount>49,99</amount><currency>PLN</currency><account>44114020040000310215823843</account><accname>Astarium^NM^00-111^ZP^Warszawa^CI^Francuska 23^ST^Polska^CT^</accname><backpage>www.koleo.pl</backpage><backpagereject>www.koleo.pl</backpagereject>"
  end

  it 'generates string with hash properly' do
    @transaction.generate_data.must_equal "<id_client>1132854509</id_client><id_trans>AABB100100</id_trans><date_valid>#{@date}</date_valid><amount>49,99</amount><currency>PLN</currency><account>44114020040000310215823843</account><accname>Astarium^NM^00-111^ZP^Warszawa^CI^Francuska 23^ST^Polska^CT^</accname><backpage>www.koleo.pl</backpage><backpagereject>www.koleo.pl</backpagereject><hash>f03043a819d0b9a88a85efc75f0eca4d71326620</hash>"
  end

  it 'codes properly with base64' do
    coded_transaction = @transaction.generate_payment
    Base64.decode64(coded_transaction).must_equal @transaction.generate_data
  end

  describe '#validate_data' do
    it 'raises an error when id_trans has more than 10 chars' do
      assert_raises(PayByNet::InvalidTransactionId) {PayByNet::Payment.new(@astarium, "01234567890", '49,99', "PLN", "koleo@koleo.pl", 'www.koleo.pl', "www.koleo.pl", "automat", "koleokoleo", @date)}
    end

    it 'raises an error when id_trans has more than 10 chars' do
      assert_raises(PayByNet::InvalidTransactionId) {PayByNet::Payment.new(@astarium, "012345", '49,99', "PLN", "koleo@koleo.pl", 'www.koleo.pl', "www.koleo.pl", "automat", "koleokoleo", @date)}
    end
  end
end

