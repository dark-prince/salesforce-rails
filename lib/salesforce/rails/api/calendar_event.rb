module Salesforce
  module Rails
    module API
      class CalendarEvent
          include Salesforce::Rails::API::Client
          
          class << self
            # Returns all calendar events.
            #
            #   Salesforce::Rails::API::Calendar::Event.all #=> [#<Event @Id="1", ...>, #<Event @Id="2", ...>, #<Event @Id="3", ...>, ...]
            def all
              client.query("SELECT Id, Subject, IsAllDayEvent, StartDateTime, EndDateTime, Description, Owner.Name, ShowAs FROM Event")
            end

            # Returns a collection of events of self that match the conditional +where_expr+, which is the WHERE part of a SOQL query.
            #
            #   Salesforce::Rails::API::Calendar::Event.query("Name = 'test'") #=> [#<Event @Id="1", @Name="test", ...>, #<Event @Id="2", @Name="test", ...>, #<Event @Id="3", @Name="test", ...>, ...]
            def query(where_expr)
              client.query("SELECT Id, Subject, IsAllDayEvent, StartDateTime, EndDateTime, Description, Owner.Name, ShowAs FROM Event WHERE #{where_expr}")
            end
          end
      end
    end
  end
end