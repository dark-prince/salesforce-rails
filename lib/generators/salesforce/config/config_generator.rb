require 'rails'

module Salesforce
  module Generators
    class ConfigGenerator < Rails::Generators::Base
      desc 'This generator generate a Salesforce-Rails gem configuration file at config/salesforce.yml'
      #class_option :ui, :type => :boolean, :default => false, :desc => "Include jQueryUI"
      source_root File.expand_path("../templates", __FILE__)

      def generate_config_file
        say_status('copying', 'salesforce.yml', :green)
        copy_file 'salesforce.yml', 'config/salesforce.yml'
      end
    end
  end
end