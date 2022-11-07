# frozen_string_literal: true

# Helper methods
module Admin
  module ApplicationHelper
    # over-ride this helper from the gem so that it allows our own parameters
    # https://stackoverflow.com/questions/56607539/unpermitted-parameter-error-when-adding-request-parameter-while-using-administra
    def clear_search_params
      params.except(:search, :_page, :locale, :mobility_locale).permit(
        :per_page, resource_name => %i[order direction]
      )
    end

    # over-ride this helper from the gem so that it allows our own parameters
    # https://stackoverflow.com/questions/56607539/unpermitted-parameter-error-when-adding-request-parameter-while-using-administra
    def sanitized_order_params(page, current_field_name)
      collection_names = page.item_associations + [current_field_name]
      association_params = collection_names.map do |assoc_name|
        { assoc_name => %i[order direction page per_page] }
      end
      params.permit(:search, :id, :_page, :per_page, :locale, :mobility_locale, association_params)
    end

    def mobility_locale_select(request_path = root_path)
      select_tag 'locale',
                 mobility_locale_options(request_path),
                 'x-data': '{}', 'x-title': 'Language Selector',
                 'x-on:change': 'window.location = $event.target.querySelector("select option:checked").dataset.url'
    end

    private

    def mobility_locale_options(request_path)
      # get the parameters that were used to determine the current route
      url_params = Rails.application.routes.recognize_path request_path

      # build an array of arrays for options_for_select
      options_array = I18n.available_locales.map do |locale|
        # get the url for the current request, but with the specified locale
        url = url_for(url_params.merge({ mobility_locale: locale }))

        # map the locale to a human-readable language
        language = t('language', locale: locale)

        # return the array for this option
        [language, locale, { 'data-url': url }]
      end

      options_for_select(options_array, selected_locale(params))
    end

    def selected_locale(params)
      # get the locale from the URL if set
      params[:mobility_locale] || I18n.locale
    end
  end
end
