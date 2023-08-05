# frozen_string_literal: true

class ContactFormController < ApplicationController
  before_action { |controller| controller.send(:update_active_menu_item, :contact) }

  def new; end

  def create
    @contact_form = ContactForm.new(contact_form_params)
    @contact_form.validate

    success = verify_recaptcha(
      action: 'contact_us', minimum_score: 0.7,
      secret_key: ENV.fetch('RECAPTCHA_SECRET_V3', nil)
    )
    checkbox_success = verify_recaptcha unless success

    Rails.logger.info "recaptcha success: #{success}"
    Rails.logger.info "recaptcha checkbox_success: #{checkbox_success}"

    if (success || checkbox_success) && @contact_form.save
      NotifierMailer.with(contact_form: contact_form_params).contact_form_email.deliver_now

      flash[:notice] = 'Your message was sent successfully.'
      redirect_to new_contact_form_url
    else
      @show_checkbox_recaptcha = true unless success
      flash.now[:alert] = 'Hmm... there was a problem. Try again?'
      render :new, status: :unprocessable_entity
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def contact_form_params
    params.require(:contact_form).permit(:first_name, :last_name, :email, :message)
  end
end
