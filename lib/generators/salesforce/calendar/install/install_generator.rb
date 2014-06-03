require 'rails'

# Supply generator for Rails 3.0.x or if asset pipeline is not enabled
#if ::Rails.version < "3.1" || !::Rails.application.config.assets.enabled
  module Salesforce
    module Calendar
      module Generators
        class InstallGenerator < ::Rails::Generators::Base
          desc "This generator installs jQuery Fullcalendar"
          source_root File.expand_path('../../../../../../vendor/assets', __FILE__)

          def copy_javascripts
            template 'javascripts/jquery-fullcalendar.js', File.join('public/javascripts', 'jquery-fullcalendar.js')
            template 'javascripts/jquery-qtip.min.js', File.join('public/javascripts', 'jquery-qtip.js')
          end

          def copy_stylesheets
            template 'stylesheets/jquery-fullcalendar.css', File.join('public/stylesheets', 'jquery-fullcalendar.css')
            template 'stylesheets/jquery-fullcalendar-print.css', File.join('public/stylesheets', 'jquery-fullcalendar-print.css')
          end
        end
      end
    end
  end
#else

#end