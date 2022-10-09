# frozen_string_literal: true

# All Administrate controllers inherit from this
# `Administrate::ApplicationController`, making it the ideal place to put
# authentication logic or other before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :set_locale

    before_action :authenticate_admin
    # before_action :authenticate_user!

    def authenticate_admin
      # TODO: Add authentication logic here.
      authenticate_user!
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end

    private

    def set_locale
      I18n.locale = extract_locale || I18n.default_locale
    end

    def extract_locale
      if current_user.nil?
        parsed_locale = params[:locale]
        I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
      else
        I18n.available_locales.map(&:to_s).include?(current_user['locale']) ? current_user['locale'] : nil
      end
    end

    def default_url_options
      { locale: I18n.locale }
    end
  end
end
