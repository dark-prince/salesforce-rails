require 'databasedotcom'
require 'salesforce/rails/version'
require 'yaml' unless defined?(YAML)
require File.join(File.dirname(__FILE__), 'rails', 'api', '**', '*.rb')