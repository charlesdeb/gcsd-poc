# frozen_string_literal: true

# parent controller class for application
class ApplicationController < ActionController::Base
  include HttpAuthConcern
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  before_action :set_locale

  # doesn't work with devise for translating error messages
  # See https://github.com/wardencommunity/warden/issues/180
  # around_action :switch_locale

  # decorate the devise current_user object with draper stuff
  # https://www.devroom.io/2012/04/14/decorating-devise-s-current_user-with-draper/
  # currently, decorators have been retired in favour of partials - but that
  # decision may be revised.
  # def current_user
  #   UserDecorator.decorate(super) unless super.nil?
  # end

  # code idea from https://boringrails.com/tips/boring-breadcrumbs-rails
  # active_menu_item is used for keeping track of which main menu item is active
  helper_method :active_menu_item

  attr_reader :active_menu_item

  def update_active_menu_item(page)
    @active_menu_item = page.to_sym
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

  private

  def set_locale
    I18n.locale = extract_locale || I18n.default_locale
  end

  # doesn't work with devise for translating error messages
  # def switch_locale(&)
  #   locale = params[:locale] || I18n.default_locale
  #   I18n.with_locale(locale, &)
  # end

  def extract_locale
    parsed_locale = params[:locale]
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
