# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper, :type => :helper do
  describe '#locale_select' do
    before(:each) do
      allow(I18n).to receive(:available_locales) { %i[en fr] }
    end
    let(:locale) { :fr }

    it 'contains a select tag' do
      expect(helper.locale_select).to include('<select')
    end

    context 'no locale provided in path' do
      let(:request_path) { '/' }

      before(:each) do
        allow(I18n).to receive(:locale) { :fr }
      end

      subject { helper.locale_select(request_path) }

      it 'contains a selected option of default locale' do
        expect(subject).to include('<option data-url="/fr" selected="selected"')
      end
    end

    context 'locale provided in path' do
      let(:request_path) { '/fr' }

      subject { helper.locale_select(request_path) }

      it 'contains a selected option with locale from path' do
        expect(subject).to include('<option data-url="/fr" selected="selected"')
      end
    end
  end

  describe '#timezone_select' do
    it 'contains a select tag' do
      expect(helper.timezone_select).to include('<select')
    end

    it 'contains given timezones' do
      expect(helper.timezone_select).to include('<option value="UTC+0"')
      expect(helper.timezone_select).to include('<option value="Europe/London"')
      expect(helper.timezone_select).to include('<option value="Europe/Paris"')
      expect(helper.timezone_select).to include('<option value="Europe/Bucharest"')
      expect(helper.timezone_select).to include('<option value="Asia/Almaty"')
      expect(helper.timezone_select).to include('<option value="Asia/Singapore"')
      expect(helper.timezone_select).to include('<option value="Australia/Sydney"')
      expect(helper.timezone_select).to include('<option value="Pacific/Auckland"')
      expect(helper.timezone_select).to include('<option value="America/New_York"')
      expect(helper.timezone_select).to include('<option value="America/Vancouver"')
    end
  end

  describe '#session_type_tab' do
    let(:event) { create(:published_event_with_image_and_sessions) }
    context 'first tab' do
      subject do
        helper.session_type_tab event.session_types_with_counts.first, 0
      end

      # TODO: seems like a very fragile test...
      it 'is selected' do
        expect(subject).to include('text-orange-900')
      end
    end

    context 'other tabs' do
      subject do
        helper.session_type_tab event.session_types_with_counts.first, 1
      end

      # TODO: seems like a very fragile test...
      it 'is not selected' do
        expect(subject).to include('text-orange-500')
        expect(subject).to include('hover:text-orange-700')
      end
    end
  end

  describe '#wide_main_menu_item_class' do
    it 'includes \'active\' when menu_item is the same as the active_menu_item' do
      subject = helper.wide_main_menu_item_class :foo, :foo

      expect(subject).to include('active')
    end

    it 'does not include \'active\' when menu_item is not the same as the active_menu_item' do
      subject = helper.wide_main_menu_item_class :foo, :bar

      expect(subject).not_to include('active')
    end
  end

  describe '#timetable_session_presenter_bio' do
    it 'shows the presenter_bio_override if set' do
      presenter_bio = 'Presenter bio'
      presenter_bio_override = 'Presenter override'
      presenter = create(:presenter, bio: presenter_bio)
      session = create(:session, presenter_bio_override: presenter_bio_override, presenters: [presenter])

      subject = helper.timetable_session_presenter_bio(session)

      expect(subject).to include(presenter_bio_override)
      expect(subject).not_to include(presenter_bio)
    end

    it 'shows the bio of the first session presenter with a bio' do
      presenter2_bio = 'Presenter bio'
      presenter1 = create(:presenter)
      presenter2 = create(:presenter, bio: presenter2_bio)
      session = create(:session, presenters: [presenter1, presenter2])

      subject = helper.timetable_session_presenter_bio(session)

      expect(subject).to include(presenter2_bio)
    end
  end

  describe '#show_gtm?' do
    it 'is true in production for non-admin users' do
      env = double('env', :production? => true)
      current_user = double('current_user', :admin? => false)

      expect(helper.show_gtm?(env, current_user)).to be(true)
    end

    it 'is true in production for non-logged in users' do
      env = double('env', :production? => true)
      current_user = nil

      expect(helper.show_gtm?(env, current_user)).to be(true)
    end

    it 'is false for admin users' do
      env = double('env', :production? => true)
      current_user = double('current_user', :admin? => true)

      expect(helper.show_gtm?(env, current_user)).to be(false)
    end

    it 'is false in any env other than production' do
      env = double('env', :production? => false)
      current_user = double('current_user', :admin? => false)

      expect(helper.show_gtm?(env, current_user)).to be(false)
    end
  end

  describe '#timetable_session_time_slots' do
    it 'shows tbc if session has no time slot(s)' do
      session = FactoryBot.create(:session)

      expect(helper.timetable_session_time_slots(session)).to eq(I18n.t('.time_to_be_confirmed'))
    end

    it 'shows tbc if session has time slot(s) and event status :coming_soon' do
      coming_soon_event = FactoryBot.create(:coming_soon_event)
      time_slot = FactoryBot.create(:time_slot, event: coming_soon_event)
      session = FactoryBot.create(:session, time_slots: [time_slot], event: coming_soon_event)

      expect(helper.timetable_session_time_slots(session)).to eq(I18n.t('.time_to_be_confirmed'))
    end

    it 'shows single time slot' do
      session = FactoryBot.create(:session_with_time_slots, time_slots_count: 1)

      expect(helper.timetable_session_time_slots(session)).to have_selector('time', count: 1)
    end

    it 'shows multiple time slots' do
      session = FactoryBot.create(:session_with_time_slots, time_slots_count: 3)

      expect(helper.timetable_session_time_slots(session)).to have_selector('time', count: 3)
    end

    it 'includes duration if requested' do
      session = FactoryBot.create(:session_with_time_slots, time_slots_count: 1)

      expect(helper.timetable_session_time_slots(session, is_show_duration: true)).to have_text('minutes')
    end
  end

  describe '#register_link' do
    before { helper.instance_variable_set(:@virtual_path, 'events.full_event') }

    it 'shows nothing if event not published' do
      %i[draft coming_soon archived].each do |status|
        event = FactoryBot.create(:event, status: status)
        expect(helper.register_link(event)).to be_blank
      end
    end

    # useless test, since an event cannot be published without a rego URL
    it 'shows nothing if no registration_url'

    it 'shows nothing if event past' do
      event = FactoryBot.create(
        :event,
        status: :published,
        starting_at: Time.zone.today.last_week,
        registration_url: 'https://example.com'
      )

      expect(helper.register_link(event)).to be_blank
    end

    it 'shows <a> with registration_url' do
      event = FactoryBot.create(
        :event,
        status: :published,
        starting_at: Time.zone.today.next_week,
        registration_url: 'https://example.com'
      )

      expect(helper.register_link(event)).to have_link t('events.full_event.register_now'), href: event.registration_url
    end
  end

  describe '#session_duration' do
    it 'returns length in minutes' do
      duration_parts = {  minutes: 45 }

      expect(helper.session_duration(duration_parts)).to eq('45 minutes')
    end

    it 'returns length in hours and minutes' do
      duration_parts = { hours: 1, minutes: 45 }

      expect(helper.session_duration(duration_parts)).to eq('1 hour 45 minutes')
    end
  end
end
