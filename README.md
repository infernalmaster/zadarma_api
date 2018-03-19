# ZadarmaApi

Client for https://zadarma.com/ua/support/api/

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'zadarma_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zadarma_api

## Usage

```ruby
client = ZadarmaApi::Client.new(ZADARMA_KEY, ZADARMA_SECRET)
response = client.call '/v1/sms/send/', 'POST', { number: '380919347255', message: 'Hello! there ='}
```

**`number` should contain only digits (don't use `+` prefix)**

So `response` is just raw [RestClient::Response](https://github.com/rest-client/rest-client) and you can parse it:

```ruby
require 'json'

JSON.parse(response.body) # => {"status"=>"success", "balance"=>3.3563, "currency"=>"USD", "sandbox"=>true}
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

Set env variables ZADARMA_KEY and ZADARMA_SECRET when running tests:

    $ ZADARMA_KEY=xxx ZADARMA_SECRET=xxx  rake test

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/zadarma_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the ZadarmaApi project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/zadarma_api/blob/master/CODE_OF_CONDUCT.md).
