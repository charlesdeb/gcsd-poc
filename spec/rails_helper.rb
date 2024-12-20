# frozen_string_literal: true

# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
require 'support/with_clues'
require 'support/helpers'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# add factory_bot helpers
require 'support/factory_bot'

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_paths = "#{Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")

  # Always show full formatting
  config.formatter = :documentation

  # allow stuff like current_user to work in tests
  # https://stackoverflow.com/questions/41910712/helper-devise-could-not-find-the-wardenproxy-instance-on-request-environmen
  config.include Devise::Test::ControllerHelpers, type: :view
  config.include Devise::Test::ControllerHelpers, type: :controller

  # Use features from ShowMeTheCookies, https://github.com/nruth/show_me_the_cookies
  config.include ShowMeTheCookies, :type => :feature
  config.include ShowMeTheCookies, :type => :system

  # From https://github.com/fastruby/next_rails
  # Tracker deprecation messages in each file
  if ENV['DEPRECATION_TRACKER']
    DeprecationTracker.track_rspec(
      config,
      shitlist_path: 'spec/support/deprecation_warning.shitlist.json',
      mode: ENV['DEPRECATION_TRACKER'],
      transform_message: ->(message) { message.gsub("#{Rails.root}/", '') }
    )
  end

  # Adapted from
  # https://stackoverflow.com/questions/69851082/how-do-i-correct-this-selenium-initialisation-command-deprecation-warning
  Capybara.register_driver(:chrome) do |app|
    options = Selenium::WebDriver::Chrome::Options.new(args: %w[window-size=1400,1200])
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
  end

  Capybara.register_driver(:headless_chrome) do |app|
    options = Selenium::WebDriver::Chrome::Options.new(args: %w[headless window-size=1400,1200])
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
  end

  # next two configs from:
  # https://medium.com/table-xi/a-quick-guide-to-rails-system-tests-in-rspec-b6e9e8a8b5f6
  config.before(:each, type: :system) do
    driven_by :rack_test
  end

  config.before(:each, type: :system, js: true) do
    # driven_by :selenium_chrome_headless # default selenium driver
    # driven_by :selenium # uncomment this if you want to see the browser do it's thing - but it's a little slower
    driven_by :headless_chrome
    # driven_by :chrome # uncomment this if you want to see the browser do it's thing in a big window
  end

  # Register custom drivers with ShowMeTheCookies
  ShowMeTheCookies.register_adapter(:headless_chrome, ShowMeTheCookies::Selenium)
  ShowMeTheCookies.register_adapter(:chrome, ShowMeTheCookies::Selenium)

  config.include TestSupport::WithClues, type: :system
  config.include Helpers
end
