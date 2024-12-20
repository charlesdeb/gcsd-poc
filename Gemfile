def next?
  File.basename(__FILE__) == "Gemfile.next"
end

source 'https://rubygems.org'
git_source(:github) { |repo| 'https://github.com/#{repo}.git' }

ruby '3.1.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
# gem 'rails', '~> 7.0.3'
# seems to be a problem with trix and rails 7.0.8.4
# https://github.com/rails/rails/issues/52077
# but not one in 7.1.3.4 when we do the upgrade
gem 'rails'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '< 7'

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'importmap-rails'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem 'kredis'

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem 'bcrypt', '~> 3.1.7'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Sass to process CSS
# gem 'sassc-rails'

# add some translations
gem 'rails-i18n'

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem 'image_processing'

# All runtime config comes from the UNIX environment
# but we use dotenv to store that in files for
# development and testing
gem 'dotenv-rails', groups: [:development, :test]

# Brakeman analyzes our code for security vulnerabilities
gem 'brakeman'

# bundler-audit checks our dependencies for vulnerabilities
gem 'bundler-audit'

# lograge changes Rails' logging to a more
# traditional one-line-per-event format
gem 'lograge'

# Foreman runs all processes for local development
gem 'foreman'

gem 'tailwindcss-rails', '~> 2.0'

gem 'devise'

gem 'administrate'

gem 'administrate-field-active_storage'

# used for decorating views - but not currently in use
# gem 'draper'

# for translating model column values
gem 'mobility'
gem 'mobility-actiontext'

# Used for testing emails
gem 'mail_interceptor', group: [:development, :staging]

# Google Recaptcha for the contact form
gem 'recaptcha'

# Add meta tags to pages for better SEO
gem 'meta-tags'

# Support for AWS S3 and S3 compatible storage
gem 'aws-sdk-s3', require: false

# use slugs for events
gem 'friendly_id', '~> 5.4.0'

# debugging stuff
gem 'scout_apm'

group :development, :test do
  # find and kill n+1 issues
  gem 'bullet'
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[ mri mingw x64_mingw ]

  # Shows more fine-grained error location
  gem 'error_highlight', '>= 0.4.0'
  gem 'factory_bot_rails'
  gem 'htmlbeautifier'
  gem 'rspec-rails'
  gem 'rubocop'

  # Used for local development by a vs-code plugin
  gem 'ruby-lsp'

  # We use Faker to generate values for attributes
  # in each factory
  gem 'faker'
end

group :staging, :production do
  # JS runtime that the terser minifier uses; requires nodejs on server
  gem 'execjs'

  # for compressing js and css.
  # gem 'cssminify' # doesn't work so well for background image in the timezone select
  gem 'terser', '~> 1.2'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem 'rack-mini-profiler'

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem 'spring'

  # used for measuring how out of date dependencies are
  gem 'libyear-bundler'
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'launchy'
  gem 'next_rails'
  gem 'selenium-webdriver'
  gem 'show_me_the_cookies'
end
gem 'dockerfile-rails', '>= 1.2', :group => :development
