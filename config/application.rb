# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Gcsd
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.i18n.available_locales = %i[en fr]
    config.i18n.default_locale = :en

    # We want to be able to use any feature of our database, and the SQL format
    # makes that possible.
    # For this app, that makes heavy use of timezones, we must ensure that
    # timezones are stored with all timestamps.
    config.active_record.schema_format = :sql

    # custom validators
    config.autoload_paths += Dir[File.join(Rails.root, 'app', 'models', 'validators')]
  end
end
