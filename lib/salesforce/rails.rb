require 'yaml' unless defined?(YAML)
require 'databasedotcom'
require 'salesforce/rails/engine' if ::Rails.version >= '3.1'
require 'salesforce/rails/railtie'
require 'salesforce/rails/version'

Dir[File.join(File.dirname(__FILE__), 'rails', 'api', '**', '*.rb').to_s].each do |file|
  require file
end