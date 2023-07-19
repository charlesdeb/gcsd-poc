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

    # Based on https://github.com/thoughtbot/administrate/issues/1837
    def index # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
      # only use this method for mobility'ised classes
      return super unless resource_class.singleton_methods.include?(:i18n)

      search_term = params[:search].to_s.strip
      resources = search_term.blank? ? scoped_resource.all : i18n_search(search_term)
      resources = apply_collection_includes(resources)
      resources = order.apply(resources)
      resources = resources.page(params[:page]).per(records_per_page)
      page = Administrate::Page::Collection.new(dashboard, order: order)

      render locals: {
        resources: resources,
        search_term: search_term,
        page: page,
        show_search_bar: show_search_bar?
      }
    end

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
      { locale: I18n.locale, mobility_locale: Mobility.locale }
    end

    # From on https://github.com/thoughtbot/administrate/issues/1837
    def i18n_search(search_term)
      search_term = ActiveRecord::Base.sanitize_sql_like(search_term)
      attributes = dashboard_class::ATTRIBUTE_TYPES.select { |_, field| field.searchable? }

      resource_class.i18n do
        def match((attribute, _field), search_term)
          # TODO: add API to fields to allow matchers for other column types, e.g. `.eq(search_term)`
          instance_eval(attribute.to_s).matches("%#{search_term}%")
        end

        attributes.reduce(nil) do |memo, nxt|
          memo.nil? ? match(nxt, search_term) : memo.or(match(nxt, search_term))
        end
      end
    end
  end
end
