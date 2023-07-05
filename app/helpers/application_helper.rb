# frozen_string_literal: true

# Helper methods
module ApplicationHelper
  # Drop-down for selecting locale in main nav
  def locale_select(request_path = root_path, id = :locale)
    select_tag 'locale',
               language_options(request_path),
               id: id,
               class: i18n_selector_classes,
               'x-data': '{}', 'x-title': 'Language Selector',
               'x-on:change': 'window.location = $event.target.querySelector("select option:checked").dataset.url'
  end

  # Drop-down for selecting timezone in main nav
  def timezone_select
    select_tag 'time-zone',
               timezone_options,
               class: i18n_selector_classes,
               'x-cloak': '',
               'x-data': {},
               'x-bind:value': '$store.timeZoneSelect.state.timeZone',
               'x-title': 'Timezone Selector',
               'x-on:change': '$store.timeZoneSelect.updateTimeZone($event.target.value)',
               'data-time-zone-select': ''
  end

  def menu_page_links(width, active_menu_item)
    result =     %i[about history finance].map do |page_item|
      link_class = (if width == :wide
                      wide_main_menu_item_class(page_item, active_menu_item)
                    else
                      narrow_main_menu_item_class(page_item, active_menu_item)
                    end)
      link_to t("menu.#{page_item}"), page_path(page_item),
              class: link_class
    end
    result.join.html_safe
  end

  def i18n_selector_classes
    'text-xs sm:text-base'
  end

  # Tab headers for the session types of an event
  def session_type_tab(session_type, position) # rubocop:disable Metrics/MethodLength)
    bg_color_class = position.zero? ? 'bg-orange-800' : 'bg-transparent'

    content = content_tag(:span, "#{session_type.name} (#{session_type.count})")

    content += content_tag(
      :span, '',
      class: "#{bg_color_class} bg-orange-800 absolute inset-x-0 bottom-0 h-0.5", 'aria-hidden': true
    )

    color_class = position.zero? ? 'text-orange-900' : 'text-orange-500 hover:text-orange-700'

    content_tag :div,
                content,
                class: "#{color_class} first:rounded-tl-lg last:rounded-tr-lg group relative min-w-0 flex-1 overflow-hidden bg-orange-100 py-4 px-4 text-sm font-medium text-center hover:bg-orange-200 focus:z-10", # rubocop:disable Layout/LineLength)
                'data-session_type': "session_type_#{session_type.id}",
                'x-on:click': 'chooseSessionType'
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
  def timetable_session_header(session, width = :wide)
    h2_class = 'text-xl font-bold'
    header_class = if width == :wide
                     'bg-orange-500 text-white -mx-4 sm:-mx-6 px-4 sm:px-6 py-4'
                   else
                     'bg-orange-200 text-skyblue-600 -m-2 px-2 py-2'
                   end
    content_tag(:header,
                content_tag(:h2,
                            session.title,
                            class: h2_class) + timetable_session_presenters(session),
                class: header_class)
  end

  # The name of a session's presenter; "various" if a session has more than one
  # Params
  # +session+:: Session
  # TODO: should this be on the model?
  def timetable_session_presenters(session)
    return '' if session.presenters.blank?

    presenter_name = if session.presenters.count > 1
                       t('various_presenters')
                     else
                       session.presenters.first.name
                     end
    t('with_presenter', presenter: presenter_name)
  end

  # Shows the time_slots for a session in the full_event view
  # +session+:: Session
  def timetable_session_time_slots(session)
    return '' if session.time_slots.blank?

    time_slots = session.time_slots.map do |time_slot|
      alpine_time time: time_slot.starting_at, format: { hour: 'numeric', minute: 'numeric', weekday: 'short' }
    end

    time_slots.join(', ').html_safe
  end

  # Shows an image related to a session in the timetable view
  # This is currently just the first image it finds for a presenter
  # Params
  # +session+:: Session
  def timetable_session_image(session, location = '')
    return if session.featured_image.blank?

    common_image_class = 'shadow-md shadow-celery-400 border border-celery-700'
    image_class = if location == :modal
                    '' + common_image_class
                  else
                    'w-1/2 lg:w-2/5 ml-3 mb-3 h-full float-right ' + common_image_class
                  end

    if session.featured_image.representable?
      return image_tag session.featured_image, class: image_class, alt: session.title
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
      'border-transparent text-orange-700 hover:border-orange-700 hover:text-orange-800 inline-flex items-center px-1 pt-1 border-b-2 text-sm font-medium' # rubocop:disable Layout/LineLength
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
      'block px-4 py-2 text-base font-medium text-orange-500 hover:text-orange-800 hover:bg-orange-200 w-full text-start'
    end
  end

  # show the presenter bio override of the session if it exists
  def timetable_session_presenter_bio(session)
    if session.presenter_bio_override.blank?
      bio = nil
      session.presenters.each do |presenter|
        next if presenter.bio.body.blank?

        bio = presenter.bio
      end
    else
      bio = session.presenter_bio_override
    end
    render html: bio
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
