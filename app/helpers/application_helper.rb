# frozen_string_literal: true

# Helper methods
module ApplicationHelper
  # TODO: add some tests
  def language_select(request_path)
    select_tag 'locale', language_options(request_path), onchange: 'language_changer(event);'
  end

  private

  def language_options(request_path)
    # get the parameters that were used to determine the current route
    url_params = Rails.application.routes.recognize_path request_path

    # build an array of arrays for options
    options_array = I18n.available_locales.map do |locale|
      # get the url for the current request, but with the specified locale
      url = url_for(url_params.merge({ locale: locale }))

      # map the locale to a human-readable language
      language = locale_to_language(locale)

      # return the array for this option
      [language, locale, { 'data-url': url }]
    end
    options_for_select(options_array, I18n.locale)
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
