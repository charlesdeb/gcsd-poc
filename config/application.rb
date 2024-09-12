# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Gcsd
  # Sets a bunch of config for the application
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.i18n.available_locales = %i[en]
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

    config.exceptions_app = lambda { |env|
      ErrorsController.action(:show).call(env)
    }

    # No longer add autoloaded paths into `$LOAD_PATH`. This means that you won't be able
    # to manually require files that are managed by the autoloader, which you shouldn't do anyway.
    #
    # This will reduce the size of the load path, making `require` faster if you don't use bootsnap, or reduce the size
    # of the bootsnap cache if you use it.
    config.add_autoload_paths_to_load_path = false

    # Not backward compatible with previous cache formats
    config.active_support.cache_format_version = 7.1
  end
end
