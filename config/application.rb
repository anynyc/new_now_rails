require_relative 'boot'

require 'rails/all'
require "sprockets/railtie"
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)







module NewNowRails
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.assets.enabled = true
    config.assets.paths << Rails.root.join("app", "assets")
    config.action_controller.asset_host = "http://otheranother.com/assets"

  end
end
