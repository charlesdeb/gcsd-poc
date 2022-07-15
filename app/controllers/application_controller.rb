# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  # decorate the devise current_user object with drpaer stuff
  # https://www.devroom.io/2012/04/14/decorating-devise-s-current_user-with-draper/
  def current_user
    UserDecorator.decorate(super) unless super.nil?
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:first_name, :last_name, :email, :password, :current_password)
    end
  end
end
