require_relative 'test_helper'

describe PayByNet::BankLoader do 

  before do 
  response_body = "<banks>
                    <bank>
                    <name>Alior Bank</name>
                    <id>24900005</id>
                    <image>24900005.png</image>
                    <card>0</card>
                    </bank>
                    <bank>
                    <name>Bank Millennium</name>
                    <id>11602202</id>
                    <image>11602202.png</image>
                    <card>1</card>
                    </bank>
                    </banks"

  stub_request(:get, "https://pbn.paybynet.com.pl/PayByNet/update/os/banks.xml").
    to_return(status: 200, body: response_body, headers: {})

  
  end

  it "get the response" do
    PayByNet::BankLoader.new.source.wont_be_nil
  end

  it "import banks" do
    import = PayByNet::BankLoader.new.import_banks
    import.must_be_instance_of Array
    import.length.must_equal 2
  end

  it 'creates bank' do 
    PayByNet::BankLoader.new.import_banks.first.must_be_instance_of PayByNet::Bank
  end
end
