# frozen_string_literal: true

# standard ActionMailer class for application
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
