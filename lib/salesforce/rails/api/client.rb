module Salesforce
  module Rails
    module API
      module Client
        module ClassMethods
          def client
            unless @client
              config = YAML.load(ERB.new(File.new(File.join(::Rails.root, 'config', 'salesforce.yml')).read).result)
              config = config.has_key?(::Rails.env) ? config[::Rails.env] : config
              username = config["username"]
              password = config["password"]
              token = config["token"]
              instance_url = config["instance_url"]
              @client = Databasedotcom::Client.new(config)
              username && password ? @client.authenticate(:username => username, :password => password) : @client.authenticate(:token => token, :instance_url => instance_url)
            end

            @client
          end

          def client=(client)
            @client = client
          end
        end

        def self.included(base)
          base.send(:extend, ClassMethods)
        end
      end
    end
  end
end