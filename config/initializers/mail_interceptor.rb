# frozen_string_literal: true

options = { forward_emails_to: ENV.fetch('FORWARD_EMAILS_TO', nil),
            deliver_emails_to: [ENV.fetch('DELIVER_EMAILS_TO', nil)] }

unless Rails.env.test? || Rails.env.production?
  interceptor = MailInterceptor::Interceptor.new(options)
  ActionMailer::Base.register_interceptor(interceptor)
end
