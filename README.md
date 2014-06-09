# Salesforce::Rails

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

After then restart server

    $ rails s

And open browser and type [http://localhost:3000/calendar](http://localhost:3000/calendar)


## Contributing

1. Fork it ( https://github.com/dark-prince/salesforce-rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
