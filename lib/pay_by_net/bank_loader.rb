module PayByNet
  class BankLoader

    def initialize
      @source = Nokogiri::XML(RestClient.get "https://pbn.paybynet.com.pl/PayByNet/update/os/banks.xml")
    end

    def import_banks
      banks = []
      @source.xpath('//banks/bank').each do |bank|
        banks << create_bank(bank)
      end
      return banks
    end

    def create_bank(bank)
      PayByNet::Bank.new(bank).parse_bank
    end

  end
end