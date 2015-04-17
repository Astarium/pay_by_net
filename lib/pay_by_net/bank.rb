module PayByNet
  class Bank

    attr_accessor :id, :card, :bank_id, :image, :name

    def initialize(bank)
      @bank = bank      
    end

    def parse_bank
      self.name = @bank.css('name').inner_text
      self.id = @bank.css('id').inner_text
      self.bank_id = check_for_spoldzielcze(self.id)
      self.image = generate_image_link(@bank.css('image').inner_text)
      self.card = @bank.css('card').inner_text.to_i 
      return self
    end

    def check_for_spoldzielcze(id)
      if id == "BS,1" || id == "BS,2"
        "BS"
      else
        id
      end 
    end

    def generate_image_link(image)
      "https://pbn.paybynet.com.pl/PayByNetT/assets/img/" + image
    end
  end
end
