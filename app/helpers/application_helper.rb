# frozen_string_literal: true

# Helper methods
module ApplicationHelper
  def locale_select(request_path = root_path)
    select_tag 'locale',
               language_options(request_path),
               'x-data': '{}', 'x-title': 'Language Selector',
               'x-on:change': 'window.location = $event.target.querySelector("select option:checked").dataset.url'
  end

  def timezone_select
    select_tag 'time-zone',
               timezone_options,
               'x-cloak': '',
               'x-data': {},
               'x-title': 'Timezone Selector',
               'x-on:change': '$store.timeZoneSelect.updateTimeZone(document.querySelector(\'select#time-zone\').value)'
  end

  private

  def language_options(request_path)
    # get the parameters that were used to determine the current route
    url_params = Rails.application.routes.recognize_path request_path

    # build an array of arrays for options_for_select
    options_array = I18n.available_locales.map do |current_locale|
      # get the url for the current request, but with the specified locale
      url = url_for(url_params.merge({ locale: current_locale }))

      # map the locale to a human-readable language
      language = t('language', locale: current_locale)

      # return the array for this option
      [language, current_locale, { 'data-url': url }]
    end

    options_for_select(options_array, selected_locale(url_params))
  end

  def selected_locale(url_params)
    # get the locale from the URL if set
    url_params[:locale] || I18n.locale
  end

  def timezone_options
    # TODO: get these from system settings or something...
    options_for_select(%w[Europe/London Europe/Paris Europe/Berlin Asia/Singapore Australia/Sydney Pacific/Auckland])
  end
end
