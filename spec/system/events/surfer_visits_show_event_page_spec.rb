# frozen_string_literal: true

require 'rails_helper'

# so we can use strip_tags in these tests
include ActionView::Helpers::SanitizeHelper # rubocop:disable Style/MixinUsage

RSpec.feature 'Surfer visits show event', type: :system do
  let(:title) { 'Groovy Event' }
  let(:description) { 'Some stuff about an event' }
  let(:default_time_zone) { 'Europe/London' }
  let(:new_time_zone) { 'Asia/Singapore' }

  context('overview of any coming soon or published event') do
    let!(:event) do
      FactoryBot.create(
        :published_event_with_image_and_sessions,
        starting_at: Time.zone.now,
        title: title,
        description: description
      )
    end

    before(:each) do
      # as per https://stackoverflow.com/questions/59295991/set-locale-via-default-url-options-for-rails-tests-rails-6-and-newer
      # it seems like I need to specify the :locale
      visit event_path :en, event
    end

    scenario 'they see the event title in the header' do
      expect(page.title).to include(title)
    end

    scenario 'they see the event title on the page' do
      within('div.overview') do
        expect(page).to have_text(title)
      end
    end

    scenario 'they see the description' do
      within('div.overview') do
        expect(page).to have_text(description)
      end
    end

    scenario 'they see the picture' do
      within('div.overview') do
        expect(page).to have_css("img[alt='#{title}']")
      end
    end

    scenario 'they see description in the page meta' do
      find("head meta[name='description'][content='#{description}']", visible: false)
    end

    # see i18n tests for more timezone related tests
    scenario 'they see the start date (in the default time zone)', js: true do
      within('div.overview') do
        expected_date_string = I18n.l(
          event.starting_at.in_time_zone(default_time_zone),
          format: :starting_at
        ).strip
        find(:xpath, ".//time[text()='#{expected_date_string}']")
      end
    end

    # scenario('they can donate to the event')
    scenario 'they see a donate button' do
      within('div.overview') do
        expect(page).to have_link(I18n.t('events.full_event.donate'))
      end
    end
  end

  context 'coming soon event' do
    let!(:event) do
      FactoryBot.create(
        :coming_soon_event,
        starting_at: Time.zone.now,
        title: title,
        description: description
      )
    end

    before(:each) do
      visit event_path :en, event
    end

    scenario 'they see a \'let me know when I can sign up\' form' do
      pending
      within('section.register_interest') do
        # save_and_open_page
        # expect(page).to have_form_stuff...
      end
    end

    scenario 'they don\'t see a register now button' do
      # save_and_open_page
      expect(page).not_to have_link(I18n.t('events.full_event.register_now'))
    end

    scenario 'they don\'t see the summary' do
      expect(page).not_to have_selector 'section#event-sessions-summary'
    end

    scenario 'they don\'t see the timetable' do
      expect(page).not_to have_selector 'section#event-timetable'
    end

    context 'with sessions' do
      let!(:event) { FactoryBot.create(:coming_soon_event) }
      let!(:time_slot) { FactoryBot.create(:time_slot, event: event) }
      let!(:session) { FactoryBot.create(:session, time_slots: [time_slot], event: event) }

      # let!(:event) do
      #   FactoryBot.create(
      #     :coming_soon_event,
      #     starting_at: Time.zone.now,
      #     title: title,
      #     description: description
      #   )
      # end

      before(:each) do
        visit event_path :en, event
      end

      scenario 'they see the summary' do
        expect(page).to have_selector 'section#event-sessions-summary'
      end
    end
  end

  context 'published future event' do
    let!(:event) do
      FactoryBot.create(
        :published_event_with_image_and_sessions,
        starting_at: Time.zone.now.next_week,
        title: title,
        description: description
      )
    end

    before(:each) do
      visit event_path :en, event
    end

    # scenario('they can register for the event')

    scenario 'they see a register now button' do
      within('div.overview') do
        # save_and_open_page
        expect(page).to have_link(I18n.t('events.full_event.register_now'))
      end
    end

    context('summary information') do
      let!(:session_type_names) { %w[Plenaries Worship Workshops] }
      let!(:session_types) { session_type_names.map { |name| create(:session_type, name: name) } }

      # create one session of each type
      let!(:sessions) do
        sessions = session_type_names.map.with_index do |name, index|
          create(:session,
                 title: "#{name} session",
                 description: "#{name} session's description",
                 session_type_id: session_types[index].id,
                 event_id: event.id)
        end

        # add an extra plenary sessions
        sessions << create(
          :session,
          title: "Extra #{session_type_names[0]} session",
          description: "#{session_type_names[0]} session's description",
          session_type_id: session_types[0].id,
          event_id: event.id
        )
        sessions
      end

      before(:each) do
        visit event_path :en, event
      end

      scenario 'they see the summary' do
        expect(page).to have_selector 'section#event-sessions-summary'
        within('section#event-sessions-summary') do
          expect(page).to have_selector 'h2', text: I18n.t('events.sessions_summary.sessions_summary')
        end
      end

      scenario 'they see the session types (in a tab control)', js: true do
        within('section#event-sessions-summary nav') do
          expect(page).to have_text('Plenaries (2)')
          expect(page).to have_text('Worship (1)')
          expect(page).to have_text('Workshops (1)')
        end
      end

      context('for each session type') do
        scenario('they see the image')
        scenario('they see the general blurb')
        scenario('they see the sessions (as a list)')

        context('for each session') do
          scenario('they see the presenter name')
          scenario('they see the session title')
          scenario('they see the session time')
        end
      end
    end

    context('full programme details') do
      before(:each) do
        visit event_path :en, event
      end

      scenario 'they can see the timetable' do
        # save_and_open_page
        expect(page).to have_selector 'section#event-timetable'
      end

      scenario('they see the time slots') do
        time_slots_count = event.time_slots.count
        within('section#event-timetable') do
          expect(page).to have_selector('#timetable-time-slots tr[data-time_slot]', count: time_slots_count)
        end
      end

      context 'for each time_slot', js: true do
        scenario 'they see the right info' do
          event.time_slots.each do |time_slot|
            within("section#event-timetable tr[data-time_slot='time_slot_#{time_slot.id}']") do
              # TODO: figure out timezones here
              # expect(page).to have_text(
              #   I18n.l(time_slot.starting_at,
              #          format: '%I:%M')
              # )
              expect(page).to have_text(time_slot.title)
            end
          end
        end

        scenario 'they can click to see the sessions thumbnails for the time slot' do
          time_slot = event.time_slots.first

          within('section#event-timetable') do
            # session stuff should not be visible before clicking the time slot
            expect(page).not_to have_text(/#{time_slot.sessions.first.title}/i)
          end

          within("section#event-timetable tr[data-time_slot='time_slot_#{time_slot.id}']") do
            # click on something that isn't actually a real link
            page.find('td', text: time_slot.title).click
          end

          # session stuff should now be visible
          expect(page).to have_text(/#{time_slot.sessions.first.title}/i)

          # but the full details are not visible until clicked on
          stripped_description = strip_tags(time_slot.sessions.first.description.body.to_s).squish
          expect(page).not_to have_text(/#{stripped_description}/i)
        end

        context('for a session') do
          let(:time_slot) { event.time_slots.first }

          before(:each) do
            # p time_slot
            # click on a time slot
            within("section#event-timetable tr[data-time_slot='time_slot_#{time_slot.id}']") do
              # click the time slot
              page.find('td div', text: time_slot.title).click
            end

            within('section#event-timetable .timetable-summaries') do
              expect(page).to have_text(/#{time_slot.sessions.first.title}/i, wait: 1)
              # click a session within that time_slot
              page.find('p', text: time_slot.sessions.first.title).click
            end
          end

          scenario('they see the title') do
            expect(page).to have_text(/#{time_slot.sessions.first.title}/i)
          end

          scenario('they see the description') do
            stripped_description = strip_tags(time_slot.sessions.first.description.body.to_s).squish
            expect(page).to have_text(/#{stripped_description}/i)
          end

          scenario('they see the presenter name') do
            # save_and_open_page
            expect(page).to have_text(/#{time_slot.sessions.first.presenters.first.name}/i)
          end

          scenario('they see the presenter\'s bio') do
            stripped_bio = strip_tags(time_slot.sessions.first.presenters.first.bio.body.to_s).squish
            expect(page).to have_text(/#{stripped_bio}/i)
          end
        end

        context('for a session with more than one presenter') do
          scenario('they see the presenter names')
          scenario('they do not see the bios of the presenters')
          scenario('they see the session presenter_bio override')
        end

        context('for a session with a presenter bio override') do
          scenario('they do not see the bio of the presenter')
          scenario('they see the session presenter_bio override')
        end
      end
    end
  end
end
