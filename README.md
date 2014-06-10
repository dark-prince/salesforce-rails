# Salesforce::Rails

[![Gem Version](https://badge.fury.io/rb/salesforce-rails.svg)](http://badge.fury.io/rb/salesforce-rails) [![Build Status](https://travis-ci.org/dark-prince/salesforce-rails.svg)](https://travis-ci.org/dark-prince/salesforce-rails) [![Code Climate](https://codeclimate.com/github/dark-prince/salesforce-rails.png)](https://codeclimate.com/github/dark-prince/salesforce-rails) [![Dependency Status](https://gemnasium.com/dark-prince/salesforce-rails.svg)](https://gemnasium.com/dark-prince/salesforce-rails) [![License](http://img.shields.io/license/MIT.png?color=green)](http://opensource.org/licenses/MIT) [![Coverage Status](https://coveralls.io/repos/dark-prince/salesforce-rails/badge.png?branch=master)](https://coveralls.io/r/dark-prince/salesforce-rails?branch=master)

salesforce_rails is a gem to access salesforce calender in rails application much more easier. If you use bundler, simply list it in your Gemfile, like so:

    gem 'salesforce-rails'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install salesforce-rails

## Usage
### Configuration

    $ rails g salesforce:config

```yaml
# salesforce.yml
#
---
development:
  client_secret: foo
  client_id: bar
```

### Calendar installation

    $ rails g salesforce:calendar:install

Then

    $ rails s

And open browser and type [http://localhost:3000/calendar](http://localhost:3000/calendar)


## Contributing

1. Fork it ( https://github.com/dark-prince/salesforce-rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Make sure there are tests! I will not accept any patch that is not tested. It's a rare time when explicit tests are not needed. If you have questions about writing tests for salesforce_rails, please open a [GitHub issue](https://github.com/dark-prince/salesforce-rails/issues/new).
6. Create a new Pull Request

## License

Salesforce::Rails is Copyright (c) 2014 Diganta Mandal. It is free software, and may be redistributed under the terms specified in the MIT-LICENSE file.
