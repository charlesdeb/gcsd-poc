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

    # use lazy loading by default
    config.action_view.image_loading = :lazy

    # allow webp image format
    config.active_storage.web_image_content_types = %w[image/jpeg image/png image/webp image/jpg]

    # Email settings. It is being set here rather in a specific environment
    # file because we are using the mail_interceptor gem which operates in
    # multiple environments
    config.action_mailer.smtp_settings = {
      :user_name => ENV.fetch('SMTP_USER_NAME', nil),
      :password => ENV.fetch('SMTP_PASSWORD', nil),
      :domain => ENV.fetch('SMTP_DOMAIN', nil),
      :address => ENV.fetch('SMTP_ADDRESS', nil),
      :port => 587,
      :authentication => :plain,
      :enable_starttls_auto => true
    }
  end
end
