# frozen_string_literal: true

class NotifierMailer < ApplicationMailer
  default to: ENV.fetch('MAILER_SENDER', nil),
          from: ENV.fetch('MAILER_SENDER', nil)

  def contact_form_email
    @contact_form = params[:contact_form]

    first_name = @contact_form[:first_name]
    last_name = @contact_form[:last_name]
    email = @contact_form[:email]

    mail(
      'reply-to': email_address_with_name(email, "#{first_name} #{last_name}"),
      subject: 'Contact form message from GCSD website'
    )
  end
end
