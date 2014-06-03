module Salesforce
  module Rails
    module Generators
      class ConfigGenerator < Rails::Generators::Base
        desc 'Creates a Salesforce-Rails gem configuration file at config/salesforce.yml'

        source_root File.expand_path("../templates", __FILE__)

        def create_config_file
          template 'salesforce.yml', File.join('config', 'salesforce.yml')
        end
      end
    end
  end
end