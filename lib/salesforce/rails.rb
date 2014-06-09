require 'yaml' unless defined?(YAML)
require 'databasedotcom'
require 'rails'
require 'salesforce/rails/engine' if ::Rails.version >= '3.1'
require 'salesforce/rails/version'

require 'salesforce/rails/api/client.rb'
Dir[File.join(File.dirname(__FILE__), 'rails', 'api', '**', '*.rb').to_s].each do |file|
  require file
end