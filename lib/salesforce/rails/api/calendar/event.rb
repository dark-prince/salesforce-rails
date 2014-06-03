module Salesforce
  module Rails
    module API
      module Calendar
        class Event
          # @return [String] Returns the unique identification of event.
          # @return [String] Returns the subject of event.
          # @return [Boolean] Returns the boolean value based on event duration if event duration is whole day then value is true otherwise it's return false value.
          # @return [DateTime] Returns the start datetime of event.
          # @return [DateTime] Returns the end datetime of event.
          # @return [String] Returns the assign_to of event.
          # @return [String] Returns the description of event.
          # @return [String] Returns the status of event it's either 'Busy' or 'Out of Office'.
          attr_reader :id, :subject, :is_all_day_event, :start_date, :end_date, :assign_to, :description, :show_as

          def initialize(data={})
            @id = data[:id]
            @subject = data[:subject]
            @is_all_day_event = data[:is_all_day_event]
            @start_date = data[:start_date]
            @end_date = data[:end_date]
            @assign_to = data[:assign_to]
            @description = data[:description]
            @show_as = data[:show_as]
          end

          class << self
            attr_accessor :events

            # Returns all calendar events.
            #
            #   Salesforce::Rails::API::Calendar::Event.all #=> [#<Salesforce::API::Calendar @id="1", ...>, #<Salesforce::API::Calendar @id="2", ...>, #<Salesforce::API::Calendar @id="3", ...>, ...]
            def all
              refresh_events(client.query("SELECT Id, Subject, IsAllDayEvent, StartDateTime, EndDateTime, Description, Owner.Name, ShowAs FROM Event"))
            end

            # Returns a collection of events of self that match the conditional +where_expr+, which is the WHERE part of a SOQL query.
            #
            #   Salesforce::Rails::API::Calendar::Event.query("Name = 'test'") #=> [#<Salesforce::API::Calendar @id="1", @name="test", ...>, #<Salesforce::API::Calendar @id="2", @name="test", ...>, #<Salesforce::API::Calendar @id="3", @name="test", ...>, ...]
            def query(where_expr)
              refresh_events(client.query("SELECT Id, Subject, IsAllDayEvent, StartDateTime, EndDateTime, Description, Owner.Name, ShowAs FROM Event WHERE #{where_expr}"))
            end

            private

            def refresh_events(data)
              self.events = []
              data.each do |event|
                attrs = {
                  :id => event.Id,
                  :subject => event.Subject,
                  :is_all_day_event => event.IsAllDayEvent,
                  :start_date => event.StartDateTime,
                  :end_date => event.EndDateTime,
                  :description => event.Description,
                  :show_as => event.ShowAs,
                  :assign_to => event.Owner.Name
                }

                self.events << new(attrs)
              end if data
              events
            end

            def load_data
              client

              client.materialize('Event')
              client.materialize('User')
            end

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

            private :new
          end

          load_data
        end
      end
    end
  end
end