# VaucharAPI

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/vauchar_api`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'vauchar_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install vauchar_api

## Usage

Somewhere in your application (probably as part of a new initializer) you should add the following:

```ruby
require 'vauchar_api'

VaucharAPI.config do |config|
    config.merchant_id = "your merchant id"
    config.api_key = "your api key"
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Max0325/vauchar_api.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
