# frozen_string_literal: true

require 'test_helper'

# set some defaults for selenium tests
class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  # driven_by :selenium, using: :chrome, screen_size: [1400, 1400]

  # options = Selenium::WebDriver::Chrome::Options.new(args: %w[headless window-size=1400,1000])

  Capybara.register_driver(:chrome) do |app|
    options = Selenium::WebDriver::Chrome::Options.new(args: %w[window-size=1400,1000])
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
  end

  driven_by(:chromex)
  # driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
end
