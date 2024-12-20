# frozen_string_literal: true

require 'active_support/core_ext/integer/time'

Rails.application.configure do
  # Bullet slows down the dev environment (because it is checking for duff
  # queries, but after the N+1s have been fixed and the gem is not running
  # then database performance was a bit better. For the full event page,
  # constructing the initial HTML page went from 1.48 -> 1.19s (20% reduction)
  # and the avg for subsequent loads from 0.679 -> 0.607s (10% reduction)
  config.after_initialize do
    Bullet.enable        = true
    Bullet.alert         = false
    Bullet.bullet_logger = true
    Bullet.console       = true
    Bullet.rails_logger  = true
    Bullet.add_footer    = true
  end

  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded any time
  # it changes. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.enable_reloading = true

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable server timing
  config.server_timing = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Store uploaded files on the local file system (see config/storage.yml for options).
  # config.active_storage.service = :local
  config.active_storage.service = :filebase

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Setting added by CdeB after installing devise
  config.action_mailer.default_url_options = {
    host: 'localhost',
    port: 3000
  }

  # Print deprecation notices to the Rails logger.
  # config.active_support.deprecation = :log
  # Raise errors for deprecation notices
  config.active_support.deprecation = :raise

  # Raise exceptions for disallowed deprecations.
  config.active_support.disallowed_deprecation = :raise

  # Tell Active Support which deprecation messages to disallow.
  config.active_support.disallowed_deprecation_warnings = []

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # Highlight code that enqueued background job in logs.
  config.active_job.verbose_enqueue_logs = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations.
  config.i18n.raise_on_missing_translations = true

  # Annotate rendered view with file names.
  # config.action_view.annotate_rendered_view_with_filenames = true

  # Uncomment if you wish to allow Action Cable access from any origin.
  # config.action_cable.disable_request_forgery_protection = true

  config.action_controller.action_on_unpermitted_parameters = :raise

  # config.logger = Logger.new(STDOUT)

  # Raise error when a before_action's only/except options reference missing actions
  config.action_controller.raise_on_missing_callback_actions = true

  # minification - normally commented out in dev env
  # https://guides.rubyonrails.org/asset_pipeline.html
  # https://github.com/matthiassiegel/cssminify
  # config.assets.css_compressor = CSSminify.new
  # https://github.com/ahorek/terser-ruby
  # config.assets.js_compressor = :terser

  # config.assets.debug = true
end
