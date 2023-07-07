# frozen_string_literal: true

class ContactFormController < ApplicationController
  # before_action :update_active_menu_item, :contact
  before_action { |controller| controller.send(:update_active_menu_item, :contact) }

  def new; end

  def create
    # TODO: ensure that mandatory forms are filled out
    NotifierMailer.with(contact_form: params[:contact_form]).contact_form_email.deliver_now

    flash[:notice] = 'Your message was sent successfully.'
    redirect_to new_contact_form_url
  end
end
