# Used to ensure that Rails 3.0.x, as well as Rails >= 3.1 with asset pipeline disabled
# get the minified version of the scripts included into the layout in production.
module Salesforce
  module Rails
    class Railtie < ::Rails::Railtie
      config.before_configuration do
        if config.action_view.javascript_expansions

          config.action_view.javascript_expansions[:defaults] |= ['salesforce-calendar']
        end
      end
    end
  end
end