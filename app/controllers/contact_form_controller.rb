# frozen_string_literal: true

class ContactFormController < ApplicationController
  def new; end

  def create
    @first_name = params[:contact_form][:first_name]
    @last_name = params[:contact_form][:last_name]
    @email = params[:contact_form][:email]
    @message = params[:contact_form][:message]

    # Perform any necessary actions with the form data
    flash[:notice] = 'Your message was sent successfully.'
    redirect_to new_contact_form_url
  end
end
