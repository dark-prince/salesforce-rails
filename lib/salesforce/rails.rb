require 'databasedotcom'
require 'salesforce/rails/version'
require 'yaml' unless defined?(YAML)

Dir[File.join(File.dirname(__FILE__), 'rails', 'api', '**', '*.rb').to_s].each do |file|
  require file
end