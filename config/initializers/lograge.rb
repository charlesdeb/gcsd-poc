# frozen_string_literal: true

Rails.application.configure do
  # show single line logs unless we're in development or ENV has been set
  config.lograge.enabled = if !Rails.env.development? ||
                              ENV['LOGRAGE_IN_DEVELOPMENT'] == 'true'
                             true
                           else
                             false
                           end
end
