require 'bundler/setup'
require 'salesforce-rails'
require 'rails_mocks'

RSpec.configure do |config|
  config.color = true
  config.order = "rand"
end