module PayByNet
  class BankLoader

    def initialize
      @source = Nokogiri::XML(RestClient.get "https://pbn.paybynet.com.pl/PayByNet/update/os/banks.xml")
    end

    def import_banks
      @source.xpath('//banks/bank').map do |bank|
        create_bank(bank)
      end
    end

    def create_bank(bank)
      PayByNet::Bank.new(bank).parse_bank
    end

  end
end
