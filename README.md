# TaxJar Ruby Gem

<a href="http://developers.taxjar.com"><img src="http://www.taxjar.com/img/TJ_logo_color_office_png.png" alt="TaxJar" width="220"></a>

A Ruby interface to the TaxJar API. TaxJar makes sales tax filing easier for online sellers and merchants. 
See local jurisdictional tax reports, get payment reminders, and more. You can use our API to access TaxJar API endpoints, 
which can get information on sales tax rates, categories or upload transactions.

* This wrapper supports 100% of the [TaxJar API Version 2](http://developers.taxjar.com/api/#introduction)
* Data returned from API calls are mapped into Ruby objects

## Gem Dependencies

Installing this gem also installs the following gems:

* [http](https://github.com/httprb/http.rb) Fast Ruby HTTP client with a chainable API and full streaming support.
* [addressable](https://github.com/sporkmonger/addressable) Replacement for the URI implementation that is part of Ruby's standard library. It more closely conforms to the relevant RFCs and adds support for IRIs and URI templates.
* [memoizable](https://github.com/dkubb/memoizable) Memoize method return values.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'taxjar-ruby', require: 'taxjar'
```

And then execute:

```shell
$ bundle install
```

Or install it yourself as:

```shell
$ gem install taxjar-ruby
```

## Quick Start Guide

First, [get an API key from TaxJar](https://app.taxjar.com/api_sign_up/plus/). Copy and paste in your API key:

```ruby
client = Taxjar::Client.new(api_key: 'YOUR KEY')
```

You are now ready to use TaxJar!

## Usage

### List all tax categories
```ruby
categories = client.categories
```

### List tax rates for a location (by zip/postal code)

```ruby
rates = client.rates_for_location('10001')
```

### Calculate Sales tax for an order

```ruby
order = client.tax_for_order({
    :to_country => 'US',
    :to_zip => '90002',
    :to_city => 'Los Angeles',
    :to_state => 'CA',
    :from_country => 'US',
    :from_zip => '92093',
    :from_city => 'San Diego',                
    :amount => 16.50,
    :shipping => 1.5,
    :line_items => [{:quantity => 1,
                     :product_identifier => '12-34243-9',
                     :unit_price => 15.0,
                     :product_tax_code => 31000}]
})
```

### Create order transaction

```ruby
order = client.create_order({
    :transaction_id => '123',
    :transaction_date => '2015/05/14',
    :to_country => 'US',
    :to_zip => '90002',
    :to_state => 'CA',
    :to_city => 'Los Angeles',
    :to_street => '123 Palm Grove Ln',
    :amount => 17.45,
    :shipping => 1.5,
    :sales_tax => 0.95,
    :line_items => [{:quantity => 1,
                     :product_identifier => '12-34243-9',
                     :description => 'Fuzzy Widget',
                     :unit_price => 15.0,
                     :sales_tax => 0.95}]
})
```

### Update order transaction

```ruby
order = client.update_order({
    :transaction_id => '123',
    :amount => 17.95,
    :shipping => 2.0,
    :line_items => [{:quantity => 1,
                     :product_identifier => '12-34243-0',
                     :description => 'Heavy Widget',
                     :unit_price => 15.0,
                     :discount => 0.0,
                     :sales_tax => 0.95}]
})
```

### Create refund transaction

```ruby
refund = client.create_refund({
    :transaction_id => '321',
    :transaction_date => '2015/05/14',
    :transaction_reference_id => '123',
    :to_country => 'US',
    :to_zip => '90002',
    :to_state => 'CA',
    :to_city => 'Los Angeles',
    :to_street => '123 Palm Grove Ln',
    :amount => 17.45,
    :shipping => 1.5,
    :sales_tax => 0.95,
    :line_items => [{:quantity => 1,
                     :product_identifier => '12-34243-9',
                     :description => 'Fuzzy Widget',
                     :unit_price => 15.0,
                     :sales_tax => 0.95}]
})
```

### Update refund transaction

```ruby
refund = client.update_refund{
    :transaction_id => '321',
    :amount => 17.95,
    :shipping => 2.0,
    :sales_tax => 0.95,
    :line_items => [{:quantity => 1,
                     :product_identifier => '12-34243-9',
                     :description => 'Heavy Widget',
                     :unit_price => 15.0,
                     :sales_tax => 0.95}]
})
```

## Tests

An RSpec test suite is available to ensure API functionality:

```shell
$ git clone git://github.com/taxjar/taxjar-ruby.git
$ bundle install
$ rspec
```

## More Information

More information can be found on the [TaxJar developer site](http://developers.taxjar.com).

## License

TaxJar is released under the [MIT License](https://github.com/taxjar/taxjar-ruby/blob/master/LICENSE.txt).

## Support

Bug reports and feature requests should be filed on the [GitHub issue tracking page](https://github.com/taxjar/taxjar-ruby/issues). 

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new pull request