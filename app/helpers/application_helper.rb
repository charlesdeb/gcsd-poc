# frozen_string_literal: true

# Helper methods
module ApplicationHelper
  # Drop-down for selecting locale in main nav
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

  def menu_page_links(width, options)
    result =     %i[about history finance].map do |page_item|
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

  def i18n_selector_classes
    'text-xs sm:text-base'
  end

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

  # Tab headers for the session types of an event
  def session_type_tab(event:, session_type_with_count:, position:) # )
    bg_color_class = position.zero? ? 'bg-orange-800' : 'bg-transparent'

    content = content_tag(:span, "#{session_type_with_count.name} (#{session_type_with_count.count})")

    content += content_tag(
      :span, '',
      class: "#{bg_color_class} bg-orange-800 absolute inset-x-0 bottom-0 h-0.5", 'aria-hidden': true
    )

    color_class = position.zero? ? 'text-orange-900' : 'text-orange-500 hover:text-orange-700'

    # content_tag :div,
    #             content,
    #             class: "#{color_class} first:rounded-tl-lg last:rounded-tr-lg group relative min-w-0 flex-1 overflow-hidden bg-orange-100 py-4 px-4 text-sm font-medium text-center hover:bg-orange-200 focus:z-10", # rubocop:disable Layout/LineLength)
    #             'data-session_type': "session_type_#{session_type.id}",
    #             'x-on:click': "chooseSessionType('session_type_#{session_type.id}')"

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

    # content_tag :div,
    #             content,
    #             class: "#{color_class} block first:rounded-tl-lg last:rounded-tr-lg group relative min-w-0 flex-1 overflow-hidden bg-orange-100 py-4 px-4 text-sm font-medium text-center hover:bg-orange-200 focus:z-10 cursor-pointer",
    #             data: {
    #               path: sessions_by_event_and_type_path(event: event.id, session_type: session_type_with_count.id,
    #                                                     locale: I18n.locale),
    #               turbo_frame: "session_type_#{session_type_with_count.id}",
    #               session_type: "session_type_#{session_type_with_count.id}",
    #               action: 'click->session-type-tabs#tabClick'
    #             }
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

  # Switches whether we show Past Events, Future Events or just Events on the
  # event index page
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

  # should we show the google tag manager stuff?
  def show_gtm?(env, current_user)
    env.production? && (current_user.nil? || !current_user.admin?)
  end

  # creates an html link for registering for an event
  def register_link(event, options = {})
    return nil unless event.published?

    return nil unless event.starting_at >= Time.zone.today

    link_to(t('.register_now'), event.registration_url, options)
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

  # returns tailwind classes suitable for the a tr of a timetable time_slot
  # time_slot:: TimeSlot
  def timetable_time_slot_tr_class(time_slot)
    return 'hover:bg-orange-300 hover:text-white' if time_slot.sessions.count.positive?

    'text-orange-600 bg-orange-50'
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
