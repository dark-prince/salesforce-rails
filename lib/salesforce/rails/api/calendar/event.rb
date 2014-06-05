module Salesforce
  module Rails
    module API
      module Calendar
        class Event
          # Returns all calendar events.
          #
          #   Salesforce::Rails::API::Calendar::Event.all #=> [#<Event @Id="1", ...>, #<Event @Id="2", ...>, #<Event @Id="3", ...>, ...]
          def self.all
            self.client.query("SELECT Id, Subject, IsAllDayEvent, StartDateTime, EndDateTime, Description, Owner.Name, ShowAs FROM Event")
          end

          # Returns a collection of events of self that match the conditional +where_expr+, which is the WHERE part of a SOQL query.
          #
          #   Salesforce::Rails::API::Calendar::Event.query("Name = 'test'") #=> [#<Event @Id="1", @Name="test", ...>, #<Event @Id="2", @Name="test", ...>, #<Event @Id="3", @Name="test", ...>, ...]
          def self.query(where_expr)
            self.client.query("SELECT Id, Subject, IsAllDayEvent, StartDateTime, EndDateTime, Description, Owner.Name, ShowAs FROM Event WHERE #{where_expr}")
          end

          private

          def client
            unless @client
              config = YAML.load_file(File.join(::Rails.root, 'config', 'salesforce.yml'))
              config = config.has_key?(::Rails.env) ? config[::Rails.env] : config
              username = config["username"]
              password = config["password"]
              @client = Databasedotcom::Client.new(config)
              @client.authenticate(:username => username, :password => password)
            end

            @client
          end
        end
      end
    end
  end
end