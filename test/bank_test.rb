require_relative 'test_helper'

describe PayByNet::BankLoader do 

  before do 
     @response = Nokogiri::XML("<bank><name>Alior Bank</name><id>BS,1</id><image>24900005.png</image><card>0</card></bank>").xpath('/bank').first
     @bank = PayByNet::Bank.new(@response)
  
  end

  it "create bank" do
    @bank.wont_be_nil
  end

  it 'parse bank' do
    @bank.parse_bank.wont_be_nil
  end
 
  describe 'bank has data' do
    it 'has name' do
      @bank.parse_bank.name.must_equal "Alior Bank"
    end

    it 'has proper bank_id' do
      @bank.parse_bank.bank_id.must_equal "BS"
    end

    it 'has id' do
      @bank.parse_bank.id.must_equal "BS,1"
    end

    it 'has proper image link' do
      @bank.parse_bank.image.must_equal "https://pbn.paybynet.com.pl/PayByNetT/assets/img/24900005.png"
    end

  end
end