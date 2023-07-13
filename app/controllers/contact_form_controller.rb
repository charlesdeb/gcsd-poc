# frozen_string_literal: true

class ContactFormController < ApplicationController
  before_action { |controller| controller.send(:update_active_menu_item, :contact) }

  def new; end

  def create
    @contact_form = ContactForm.new(contact_form_params)

    # TODO: ensure that mandatory forms are filled out

    if @contact_form.save
      NotifierMailer.with(contact_form: contact_form_params).contact_form_email.deliver_now

      flash[:notice] = 'Your message was sent successfully.'
      redirect_to new_contact_form_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def contact_form_params
    params.require(:contact_form).permit(:first_name, :last_name, :email, :message)
  end
end
