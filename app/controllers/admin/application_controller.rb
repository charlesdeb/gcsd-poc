# frozen_string_literal: true

# All Administrate controllers inherit from this
# `Administrate::ApplicationController`, making it the ideal place to put
# authentication logic or other before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_admin

    # Administrate doesn't seem to include the base app's helpers, so this is
    # needed (https://github.com/thoughtbot/administrate/issues/1238) in order
    # to use locale_select in administrate views.
    # helper all_helpers_from_path 'app/helpers'

    # the following confusing pile of includes gets stuck at the end, but is
    # a less brute-force approach to including a custom helper and dependencies:
    # include ApplicationHelper
    # include ActionView::Helpers::FormOptionsHelper
    # include ActionView::Helpers::FormTagHelper
    # include ActionView::RoutingUrlFor

    # helper_method :locale_select
    # helper_method :options_for_select
    # helper_method :url_for

    before_action :set_locales
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

    def set_locales
      # set UI locale - which is defined by the current user
      I18n.locale = extract_locale { current_user['locale'] } || I18n.default_locale

      # set mobility locale - which comes from a query param
      Mobility.locale = extract_locale { params[:mobility_locale] } || I18n.locale
    end

    def extract_locale
      locale = yield
      I18n.available_locales.map(&:to_s).include?(locale) ? locale : nil
    end

    def default_url_options
      { locale: I18n.locale }
    end
  end
end
