# frozen_string_literal: true

# Helper methods
module ApplicationHelper
  # Drop-down for selecting locale in main nav
  def locale_select(request_path = root_path)
    select_tag 'locale',
               language_options(request_path),
               'x-data': '{}', 'x-title': 'Language Selector',
               'x-on:change': 'window.location = $event.target.querySelector("select option:checked").dataset.url'
  end

  # Drop-down for selecting timezone in main nav
  def timezone_select
    select_tag 'time-zone',
               timezone_options,
               'x-cloak': '',
               'x-data': {},
               'x-bind:value': '$store.timeZoneSelect.state.timeZone',
               'x-title': 'Timezone Selector',
               'x-on:change': '$store.timeZoneSelect.updateTimeZone($event.target.value)',
               'data-time-zone-select': ''
  end

  # Tab headers for the session types of an event
  def session_type_tab(session_type, position)
    bg_color_class = position.zero? ? 'bg-orange-800' : 'bg-transparent'

    link_content = content_tag(:span, "#{session_type.name} (#{session_type.count})")

    link_content += content_tag(
      :span, '',
      class: "#{bg_color_class} bg-orange-800 absolute inset-x-0 bottom-0 h-0.5", 'aria-hidden': true
    )

    color_class = position.zero? ? 'text-orange-900' : 'text-orange-500 hover:text-orange-700'

    link_to link_content, '#',
            class: "#{color_class} first:rounded-tl-lg last:rounded-tr-lg group relative min-w-0 flex-1 overflow-hidden bg-orange-100 py-4 px-4 text-sm font-medium text-center hover:bg-orange-200 focus:z-10" # rubocop:disable Layout/LineLength
  end

  # an Alpine-enabled <time> component with an optional format object for Luxon.
  #
  # See Alpine timeZoneSelect store for more information
  #
  # Params:
  # +options+:: +Hash+ contains
  #    +:time+:: +DateTime+ time we are showing.
  #    +:format+:: +Hash+ formatting options suitable for toLocaleString in the
  #                       Javascript DateTime object. If not provided, default
  #                       is `...DateTime.DATETIME_MED, weekday: 'long'`
  #
  # Returns something like this:
  # <time datetime="Sat, 02 Apr 2022 01:00:00 +0000"
  #       x-data="{'format':{'hour':'numeric','minute':'numeric'}}"
  #       x-text="$store.timeZoneSelect.formatDateTime('2022-04-02T01:00:00Z', format)">12:00 PM</time>
  def alpine_time(options = {})
    return 'Unknown Time' if options[:time].blank?

    x_data = options[:format] ? { format: options[:format] }.to_json : ''
    x_text = if options[:format]
               "$store.timeZoneSelect.formatDateTime('#{options[:time].to_fs(:iso8601)}', format)"
             else
               "$store.timeZoneSelect.formatDateTime('#{options[:time].to_fs(:iso8601)}')"
             end

    content_tag :time, t('loading'),
                datetime: l(options[:time]),
                'x-data': x_data, 'x-text': x_text
  end

  # shows a header for a session in the timetable view
  # Params
  # +session+:: Session
  def timetable_session_header(session)
    content_tag(:header,
                content_tag(:h2,
                            session.title,
                            class: 'text-xl font-bold') + timetable_session_presenter(session),
                class: 'bg-orange-500 text-white -mx-4 px-4 py-4')
  end

  # Shows a presenter for a session in the timetable view
  # Or says "various" if a session has more than one presenter
  # Params
  # +session+:: Session
  def timetable_session_presenter(session)
    return '' if session.presenters.blank?

    presenter_name = if session.presenters.count > 1
                       t('various_presenters')
                     else
                       session.presenters.first.name
                     end

    content_tag(:h3, "#{t('with')} #{presenter_name}", class: 'text-lg')
  end

  # Shows an image related to a session in the timetable view
  # This is currently just the first image it finds for a presenter
  # Params
  # +session+:: Session
  def timetable_session_image(session)
    return if session.presenters.blank?

    session.presenters.each do |presenter|
      if presenter.featured_image.representable?
        return image_tag presenter.featured_image, class: 'w-1/3 h-full float-right',
                                                   alt: presenter.name
      end
    end
    nil
  end

  # Switches whether we show Past Events, Future Events or just Events on the
  # event index page
  def event_index_header(scope = nil)
    [scope, t('activerecord.models.event.other')].join(' ')
  end

  # Highlight the current page (or page family) in the main menu in desktop
  # Params
  # +menu_item+:: Symbol        The menu item we need a class for
  # +active_menu_item+:: Symbol The active menu item
  def wide_main_menu_item_class(menu_item, active_menu_item)
    if menu_item == active_menu_item
      # currently selected menu item
      'border-orange-900 text-orange-900 inline-flex items-center px-1 pt-1 border-b-2 text-sm font-medium active'
    else
      # other menu item
      'border-transparent text-orange-600 hover:border-orange-600 hover:text-orange-800 inline-flex items-center px-1 pt-1 border-b-2 text-sm font-medium' # rubocop:disable Layout/LineLength
    end
  end

  # Highlight the current page (or page family) in the main menu in mobile
  # Params
  # +menu_item+:: Symbol        The menu item we need a class for
  # +active_menu_item+:: Symbol The active menu item
  def narrow_main_menu_item_class(menu_item, active_menu_item)
    if menu_item == active_menu_item
      # currently selected menu item
      'border-orange-900 block px-4 py-2 border-l-4 text-base font-medium text-orange-900 bg-orange-200 hover:text-orange-800 hover:bg-orange-50' # rubocop:disable Layout/LineLength
    else
      # other menu item
      'block px-4 py-2 text-base font-medium text-orange-500 hover:text-orange-800 hover:bg-orange-100'
    end
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
    # TODO: get these from system settings or something...,
    # TODO: i18n required
    options_for_select([['UTC', 'UTC+0'],
                        ['Europe/London', 'Europe/London'],
                        ['Europe/Paris', 'Europe/Paris'],
                        ['Europe/Bucharest', 'Europe/Bucharest'],
                        ['Asia/Almaty', 'Asia/Almaty'],
                        ['Asia/Singapore', 'Asia/Singapore'],
                        ['Australia/Sydney', 'Australia/Sydney'],
                        ['Pacific/Auckland', 'Pacific/Auckland'],
                        ['America/New York', 'America/New_York'],
                        ['America/Vancouver', 'America/Vancouver']])
  end
end
