module Salesforce
  module Calendar
    module Generators
      class InstallGenerator < ::Rails::Generators::Base
        desc "This generator installs jQuery Fullcalendar"
        source_root File.expand_path('../templates', __FILE__)

        def install
          cleanup!
          append_asset_pipeline!
          setup_routes
          copy_files
        end

        protected

        def cleanup!
          # Remove old requires (if any) that included salesforce-calendar directly:
          gsub_file("app/assets/stylesheets/application.css", %r|\s*\*=\s*salesforce-calendar\s*\n|, "")
          gsub_file("app/assets/javascripts/application.js", %r|\s*\//=\s*salesforce-calendar\s*\n|, "")
          gsub_file("app/assets/javascripts/application.js", %r|\s*\//=\s*jquery.browser.min\s*\n|, "")
          gsub_file("app/assets/javascripts/application.js", %r|\s*\//=\s*jquery.browser\s*\n|, "")
        end

        def append_asset_pipeline!
          application_css = 'app/assets/stylesheets/application.css'
          if File.file?(application_css)
            insert_into_file application_css, "*= require salesforce-calendar\n", :before => " *= require_self"
          end

          application_js = 'app/assets/javascripts/application.js'
          if File.file?(application_js)
            insert_into_file application_js, "//= require salesforce-calendar\n", :after => "//= require jquery_ujs\n"
          end
        end

        def setup_routes
          route "get 'calendar', :to => 'salesforce#calendar', :as => :salesforce_calendar"
          route "get 'calendar/json-data', :to => 'salesforce#calendar_json_data', :as => :salesforce_calendar_json_data"
        end

        def copy_files
          copy_file 'salesforce_controller.rb.erb', File.join('app/controllers', 'salesforce_controller.rb')
          FileUtils.mkdir_p(File.join('app/views', 'salesforce'))
          copy_file 'calendar.html.erb', File.join('app/views', 'salesforce/calendar.html.erb')
        end
      end
    end
  end
end