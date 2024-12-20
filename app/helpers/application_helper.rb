# frozen_string_literal: true

# Helper methods
module ApplicationHelper
  # Drop-down for selecting locale in main nav
  #
  # Args:
  # - request_path (String): The current request path. Defaults to root path.
  # - id (Symbol): The id attribute for the select tag. Defaults to :locale.
  #
  # Returns:
  # - String: HTML-safe string containing the locale select dropdown.
  def locale_select(request_path = root_path, id = :locale)
    select_tag 'locale',
               language_options(request_path),
               id: id,
               class: i18n_selector_classes,
               'aria-label': t('locale'),
               'x-data': '{}', 'x-title': 'Language Selector',
               'x-on:change': 'window.location = $event.target.querySelector("select option:checked").dataset.url'
  end

  # Drop-down for selecting timezone in main nav
  #
  # Returns:
  # - String: HTML-safe string containing the timezone select dropdown.
  def timezone_select
    select_tag 'time-zone',
               timezone_options,
               class: i18n_selector_classes,
               'aria-label': t('time-zone'),
               'x-cloak': '',
               'x-data': {},
               'x-bind:value': '$store.timeZoneSelect.state.timeZone',
               'x-title': 'Timezone Selector',
               'x-on:change': '$store.timeZoneSelect.updateTimeZone($event.target.value)',
               'data-time-zone-select': ''
  end

  # Generates HTML links for menu pages.
  #
  # Args:
  # - width (Symbol): Determines the style of the menu (:wide or :narrow).
  # - options (Hash): A hash containing additional options. Expected key:
  #   - :active_menu_item (Symbol): The currently active menu item.
  #
  # Returns:
  # - String: HTML-safe string containing the menu links.
  def menu_page_links(width, options)
    result = %i[about history finance our-studios].map do |page_item|
      link_class = (if width == :wide
                      wide_main_menu_item_class(page_item, options[:active_menu_item])
                    else
                      narrow_main_menu_item_class(page_item, options[:active_menu_item])
                    end)
      link_to t("menu.#{page_item}"), page_path(page_item),
              class: link_class
    end
    result.join.html_safe
  end

  # Returns the CSS classes for i18n selectors.
  #
  # Returns:
  # - String: CSS classes for i18n selectors.
  def i18n_selector_classes
    'text-xs sm:text-base'
  end

  # Generates options for session types with counts.
  #
  # Args:
  # - event (Event): The event for which session types are being generated.
  # - session_types_with_counts (Array): Array of session types with counts.
  #
  # Returns:
  # - Array: Array of HTML option tags for session types.
  def session_type_options(event, session_types_with_counts)
    session_types_with_counts.map.with_index do |session_type_with_count, _index|
      tag.option "#{session_type_with_count.name} (#{session_type_with_count.count})",
                 #  value: "session_type_#{session_type.id}",
                 value: "session_type_#{session_type_with_count.id}",
                 #  data: { session_type: "session_type_#{session_type_with_count.id}" },
                 data: { path: sessions_by_event_and_type_path(
                   event: event.id,
                   session_type: session_type_with_count.id,
                   locale: I18n.locale
                 ) }
    end
  end

  # Returns tab headers for session types of an event.
  #
  # Args:
  # - event (Event): The event for which tabs are being generated.
  # - session_type_with_count (Object): Session type with count.
  # - position (Integer): Position of the tab.
  #
  # Returns:
  # - String: HTML-safe string containing the tab headers.
  def session_type_tab(event:, session_type_with_count:, position:) # rubocop:disable Metrics/MethodLength
    bg_color_class = position.zero? ? 'bg-orange-800' : 'bg-transparent'

    content = content_tag(:span, "#{session_type_with_count.name} (#{session_type_with_count.count})")

    content += content_tag(
      :span, '',
      class: "#{bg_color_class} bg-orange-800 absolute inset-x-0 bottom-0 h-0.5", 'aria-hidden': true
    )

    color_class = position.zero? ? 'text-orange-900' : 'text-orange-500 hover:text-orange-700'

    link_to sessions_by_event_and_type_path(
      event: event.id,
      session_type: session_type_with_count.id,
      locale: I18n.locale
    ),
            data: {
              turbo_frame: "session_type_#{session_type_with_count.id}",
              session_type: "session_type_#{session_type_with_count.id}",
              action: 'session-type-tabs#tabClick'
            },
            class: "#{color_class} block first:rounded-tl-lg last:rounded-tr-lg group relative min-w-0 flex-1 overflow-hidden bg-orange-100 py-4 px-4 text-sm font-medium text-center hover:bg-orange-200 focus:z-10" do
      content
    end
  end

  # Returns an Alpine-enabled <time> component with an optional format object
  # for Luxon.
  #
  # See Alpine timeZoneSelect store for more information
  #
  # Params:
  # +options+:: +Hash+ contains
  #    +:time+:: +DateTime+ The time we are showing.
  #    +:format+:: +Hash+ Formatting options suitable for toLocaleString in the
  #                       Javascript DateTime object. If not provided, default
  #                       is `...DateTime.DATETIME_MED, weekday: 'long'`
  #
  # Returns something like this:
  # <time datetime="Sat, 02 Apr 2022 01:00:00 +0000"
  #       x-data="{'format':{'hour':'numeric','minute':'numeric'}}"
  #       x-text="$store.timeZoneSelect.formatDateTime('2022-04-02T01:00:00Z', format)">12:00 PM</time>
  def alpine_time(options = {}) # rubocop:disable Metrics/MethodLength
    return 'Unknown Time' if options[:time].blank?

    x_data = options[:format] ? { format: options[:format] }.to_json : ''
    x_text = if options[:format]
               "$store.timeZoneSelect.formatDateTime('#{options[:time].to_fs(:iso8601)}', format)"
             else
               "$store.timeZoneSelect.formatDateTime('#{options[:time].to_fs(:iso8601)}')"
             end

    # options[:class] = '' unless options[:class].blank?

    content_tag :time, t('loading'),
                datetime: l(options[:time]),
                'x-data': x_data,
                'x-text': x_text,
                class: options[:class]
  end

  # Returns the name of a session's presenter; "various" if a session has more
  # than one.
  #
  # Args:
  # - +session+:: Session   The session object.
  #
  # Returns:
  # - String: The name of the presenter or "various" if multiple presenters.
  # TODO: should this be on the model?
  def timetable_session_presenters(session)
    return '' if session.presenters.blank?

    presenter_name = if session.presenters.length > 1
                       t('various_presenters')
                     else
                       session.presenters.first.name
                     end
    t('with_presenter', presenter: presenter_name)
  end

  # Shows the time_slots for a session in the full_event view.
  #
  # Args:
  # - +session+:: Session         The session object.
  # - +is_show_duration+::Boolean Whether to show the duration. Defaults to false.
  #
  # Returns:
  # - String: HTML-safe string representing the time slots.
  def timetable_session_time_slots(session, is_show_duration: false)
    return t('time_to_be_confirmed') if session.time_slots.blank? || session.event.coming_soon?

    time_slots = session.time_slots.map do |time_slot|
      time_tag =
        alpine_time time: time_slot.starting_at,
                    format: { hour: 'numeric', minute: 'numeric', weekday: 'short' }
      duration = is_show_duration ? " (#{session_duration(time_slot.duration_parts)})" : ''

      time_tag + duration
    end

    time_slots.join(', ').html_safe
  end

  # Switches whether we show Past Events, Future Events, or just Events on the
  # event index page.
  #
  # Args:
  # - +scope+::String The scope of events to show. Defaults to nil.
  #
  # Returns:
  # - String: The event index header.
  def event_index_header(scope = nil)
    [scope, t('activerecord.models.event.other')].join(' ').humanize
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
      'block px-4 py-2 text-base font-medium text-orange-500 hover:text-orange-800 hover:bg-orange-200 w-full text-start' # rubocop:disable Layout/LineLength
    end
  end

  # Returns the presenter bio override of the session if it exists.
  #
  # Args:
  # - +session+::Session The session object.
  #
  # Returns:
  # - String: HTML-safe string representing the presenter bio.
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

  # Determines whether to show Google Tag Manager.
  #
  # Args:
  # - env (Environment):   The current environment.
  # - +current_user+::User The current user.
  #
  # Returns:
  # - Boolean: True if in production and the current user is not an admin
  def show_gtm?(env, current_user)
    env.production? && (current_user.nil? || !current_user.admin?)
  end

  # Returns an HTML link for registering for an event.
  #
  # Args:
  # - +event+::Event  The event object.
  # - +options+::Hash Additional HTML options for the link tag.
  #
  # Returns:
  # - String: HTML-safe string representing the registration link, or nil if
  #           the event is not published or has already started.
  def register_link(event, options = {})
    return nil unless event.published?
    return nil unless event.starting_at >= Time.zone.today

    options[:target] = '_blank' if options[:target].blank?

    if options[:target] == '_blank'
      new_tab_link_to(t('.register_now'), event.registration_url, options)
    else
      link_to(t('.register_now'), event.registration_url, options)
    end
  end

  # Returns an HTML link for donating to an event.
  #
  # Args:
  # - +event+::Event  The event object.
  # - +options+::Hash Additional HTML options for the link tag.
  #
  # Returns:
  # - String: HTML-safe string representing the donation link, or nil if the
  #           donation URL is blank.
  def donate_link(event, options = {})
    return nil if event.donation_url.blank?

    options[:target] = '_blank' if options[:target].blank?

    if options[:target] == '_blank'
      new_tab_link_to(t('.donate'), event.donation_url, options)
    else
      link_to(t('.donate'), event.donation_url, options)
    end
  end

  # returns internationalised duration of a duration hash
  # duration:: ActiveSupport::Duration#parts %>
  def session_duration(duration_parts)
    out = []
    I18n.with_options(scope: 'datetime.distance_in_words') do |locale|
      out.push locale.t(:x_hours, count: duration_parts[:hours]) if duration_parts.key?(:hours)
      out.push locale.t(:x_minutes, count: duration_parts[:minutes]) if duration_parts.key?(:minutes)
    end
    out.join ' '
  end

  # returns tailwind classes suitable for a tr of a timetable time_slot
  # time_slot:: TimeSlot
  def timetable_time_slot_tr_class(time_slot)
    return 'hover:bg-orange-300 hover:text-white' if time_slot.sessions.length.positive?

    'text-orange-600 bg-orange-50'
  end

  # Returns:HTML-safe string representing a loading spinner.
  def sessions_loading_spinner
    %(
    <svg class="animate-spin h-10 w-10 text-celery-600"
         xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
      <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
      <path class="opacity-75"
            fill="currentColor"
            d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962
               7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
    </svg>
    ).html_safe
  end

  # Returns an SVG icon for opening a new tab.
  #
  # Returns:
  # - String: HTML-safe string representing the new tab icon.
  def new_tab_icon
    %(
    <svg xmlns="http://www.w3.org/2000/svg"
         viewBox="0 0 20 20" fill="currentColor" class="w-5 h-5">
      <path fill-rule="evenodd"
            d="M4.25 5.5a.75.75 0 00-.75.75v8.5c0 .414.336.75.75.75h8.5a.75.75 0 00.75-.75v-4a.75.75 0 011.5 0v4A2.25 2.25 0 0112.75 17h-8.5A2.25 2.25 0 012 14.75v-8.5A2.25 2.25 0 014.25 4h5a.75.75 0 010 1.5h-5z"
            clip-rule="evenodd" />
      <path fill-rule="evenodd"
            d="M6.194 12.753a.75.75 0 001.06.053L16.5 4.44v2.81a.75.75 0 001.5 0v-4.5a.75.75 0 00-.75-.75h-4.5a.75.75 0 000 1.5h2.553l-9.056 8.194a.75.75 0 00-.053 1.06z"
            clip-rule="evenodd" />
    </svg>).html_safe
  end

  # link_to with a new-tab icon
  def new_tab_link_to(body, url, options)
    link_to(url, options) do
      "<span>#{body}</span>#{new_tab_icon}".html_safe
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
    # From https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
    # Also see https://github.com/moment/luxon/blob/master/docs/zones.md
    options_for_select([['UTC', 'UTC+0'],
                        ['New York (US)', 'America/New_York'],
                        ['United Kingdom', 'Europe/London'],
                        ['France', 'Europe/Paris'],
                        ['South Africa', 'Africa/Johannesburg'],
                        ['Turkey', 'Asia/Istanbul'],
                        ['India', 'Asia/Kolkata'],
                        ['Singapore', 'Asia/Singapore'],
                        ['Sydney (Australia)', 'Australia/Sydney'],
                        ['New Zealand', 'Pacific/Auckland']])
  end
end
