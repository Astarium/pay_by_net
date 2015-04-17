This gem helps working with [PayByNet](http://www.paybynet.pl), internet payment system.

# Getting started

Pay_by_net works with Ruby 2.0 onwards. You can add it to your Gemfile with:

```ruby
gem 'pay_by_net'
```

Run the bundle command to install it.

## Generating hashtrans

```ruby
company = PayByNet::Account.new(id_client, company_name, postal_code, city, street, country, bank_account)
transaction = PayByNet::Payment.new(company, id_trans, amount, currency, email, backpage, backpagereject, automat, password, date_valid)
transaction.generate_payment
```

## Getting list of available banks

```ruby
banks = BankLoader.new.import_banks 
puts banks.first.image
```

## Confiriming payment

## License

MIT License. Copyright 2015 Astarium Sp. z o.o. http://astarium.pl
