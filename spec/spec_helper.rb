require 'bundler/setup'
require 'salesforce-rails'
require 'rails_mocks'
require 'coveralls'

Coveralls.wear!

RSpec.configure do |config|
  config.color = true
  config.order = "rand"
  config.expect_with :rspec do |c|
    # ...or disable the `should` syntax...
    c.syntax = :expect
  end

  config.mock_with :rspec do |c|
    c.syntax = [:expect, :should]
  end
end