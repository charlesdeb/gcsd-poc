# frozen_string_literal: true

# Helper methods
module ApplicationHelper
  def language_select(request_path = root_path)
    select_tag 'locale',
               language_options(request_path),
               'x-data': '{}', 'x-title': 'Language Selector',
               'x-on:change': 'window.location = $event.target.querySelector("select option:checked").dataset.url'
  end

  private

  def language_options(request_path)
    # get the parameters that were used to determine the current route
    url_params = Rails.application.routes.recognize_path request_path

    # build an array of arrays for options
    options_array = I18n.available_locales.map do |current_locale|
      # get the url for the current request, but with the specified locale
      url = url_for(url_params.merge({ locale: current_locale }))

      # map the locale to a human-readable language
      language = locale_to_language(current_locale)

      # return the array for this option
      [language, current_locale, { 'data-url': url }]
    end

    options_for_select(options_array, selected_locale(url_params))
  end

  def selected_locale(url_params)
    # get the get locale from the URL, then the i18n default
    url_params[:locale] || I18n.locale
  end

  def locale_to_language(locale)
    case locale
    when :tr
      'Türkçe'
    when :fr
      'Français'
    else
      'English'
    end
  end
end
