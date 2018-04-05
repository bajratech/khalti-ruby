[![Build Status](https://travis-ci.org/bajratech/khalti-ruby.png)](https://travis-ci.org/bajratech/khalti-ruby) [![codecov](https://codecov.io/gh/bajratech/khalti-ruby/branch/master/graph/badge.svg)](https://codecov.io/gh/bajratech/khalti-ruby) [![Gem Version](https://badge.fury.io/rb/khalti.svg)](https://badge.fury.io/rb/khalti) [![Open Source Love](https://badges.frapsoft.com/os/v2/open-source.png?v=103)](https://github.com/ellerbrock/open-source-badges/) [![MIT Licence](https://badges.frapsoft.com/os/mit/mit.svg?v=103)](https://opensource.org/licenses/mit-license.php)

# Khalti

Welcome to the khalti ruby gem. It is an API wrapper for Khalti payment gateway. For more info visit [Khalti Gateway Docs](http://docs.khalti.com/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'khalti'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install khalti

## Usage

    export KHALTI_SECRET_KEY=your_secret_key

It supports server side verification and transaction list/ find

Verification:

    Khalti::Verification.verify('token', 'amount')

Transaction:

    Khalti::Transaction.all
    Khalti::Transaction.find(idx)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bajratech/khalti-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Khalti project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/khalti/blob/master/CODE_OF_CONDUCT.md).
