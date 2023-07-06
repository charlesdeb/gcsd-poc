# frozen_string_literal: true

class ContactFormController < ApplicationController
  def new; end

  def create
    NotifierMailer.with(contact_form: params[:contact_form]).contact_form_email.deliver_now

    flash[:notice] = 'Your message was sent successfully.'
    redirect_to new_contact_form_url
  end
end
