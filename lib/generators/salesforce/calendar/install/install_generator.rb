require 'rails'

# Supply generator for Rails 3.0.x or if asset pipeline is not enabled
if ::Rails.version < "3.1" || !::Rails.application.config.assets.enabled
  module Salesforce
    module Calendar
      module Generators
        class InstallGenerator < ::Rails::Generators::Base
          desc "This generator installs jQuery Fullcalendar"
          source_root File.expand_path('../../../../../../vendor/assets', __FILE__)
        
          def copy_javascripts
            template 'javascripts/salesforce/fullcalendar.js', File.join('public/javascripts', 'salesforce/fullcalendar.js')
            template 'javascripts/salesforce/qtip.js', File.join('public/javascripts', 'salesforce/qtip.js')
          end

          def copy_stylesheets
            template 'stylesheets/salesforce/fullcalendar.css', File.join('public/stylesheets', 'salesforce/fullcalendar.css')
            template 'stylesheets/salesforce/fullcalendar.print.css', File.join('public/stylesheets', 'salesforce/fullcalendar.print.css')
            template 'stylesheets/salesforce/calendar.css', File.join('public/stylesheets', 'salesforce/calendar.css')
          end

          def setup_routes
            route "get 'calendar', :to => 'salesforce#calendar', :as => :salesforce_calendar"
            route "get 'calendar/json-data', :to => 'salesforce#calendar_json_data', :as => :salesforce_calendar_json_data"
          end
        end
      end
    end
  end
else
  module Salesforce
    module Calendar
      module Generators
        class InstallGenerator < ::Rails::Generators::Base
          desc "This generator installs jQuery Fullcalendar"
          source_root File.expand_path('../templates', __FILE__)

          def append_asset_pipeline!
            application_css = 'app/assets/stylesheets/application.css'
            if File.file?(application_css)
              insert_into_file application_css, %q{*= require salesforce/fullcalendar
 *= require salesforce/fullcalendar.print
 *= require salesforce/calendar
              }, :before => "*= require_self"
            end

            application_js = 'app/assets/javascripts/application.js'
            if File.file?(application_js)
              insert_into_file application_js, %q{//= require salesforce/fullcalendar
//= require salesforce/qtip
              }, :before => "//= require_tree ."
            end
          end

          def setup_routes
            #route "get 'calendar', :to => 'salesforce#calendar', :as => :salesforce_calendar"
            #route "get 'calendar/json-data', :to => 'salesforce#calendar_json_data', :as => :salesforce_calendar_json_data"
          end

          def copy_files
            #template 'salesforce_controller.rb.erb', File.join('app/controllers', 'salesforce_controller.rb')
            #template 'calendar.html.erb', File.join('app/views', 'salesforce/calendar.html.erb')
          end
        end
      end
    end
  end
end