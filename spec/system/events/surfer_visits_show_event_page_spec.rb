# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Surfer visits show event', type: :system do
  let(:title) { 'Groovy Event' }
  let(:description) { 'Some stuff about an event' }
  let!(:event) do
    FactoryBot.create(:event_with_image, starting_at: Time.zone.now,
                                         title: title, description: description)
  end

  let(:default_time_zone) { 'Europe/London' }

  context('overview of event') do
    before(:each) do
      visit event_path event
    end

    scenario 'they see the title' do
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

    scenario 'they see a donate button' do
      within('div.overview') do
        expect(page).to have_link(I18n.t('events.event.donate'))
      end
    end

    scenario 'they see a register now button' do
      within('div.overview') do
        expect(page).to have_link(I18n.t('events.event.register_now'))
      end
    end
  end

  context('actions') do
    scenario('they can donate to the event')
    scenario('they can register for the event')
  end

  context('summary information') do
    let!(:session_type_names) { %w[Plenaries Worship Workshops] }
    let!(:session_types) { session_type_names.map { |name| create(:session_type, name: name) } }
    let!(:sessions) do
      sessions = session_type_names.map.with_index do |name, index|
        create(:session,
               title: "#{name} session",
               description: "#{name} session's description",
               session_type_id: session_types[index].id,
               event_id: event.id)
      end

      sessions << create(
        :session,
        title: "#{session_type_names[0]} session",
        description: "#{session_type_names[0]} session's description",
        session_type_id: session_types[0].id,
        event_id: event.id
      )
      sessions
    end

    before(:each) do
      visit event_path event
    end

    scenario 'they see the section header' do
      within('section.session-types') do
        expect(page).to have_selector 'h2', text: I18n.t('events.sessions_summary.sessions_summary')
      end
    end

    scenario 'they see the session types (in a tab control)', js: true do
      within('section.session-types') do
        expect(page).to have_link('Plenaries (2)')
        expect(page).to have_link('Worship (1)')
        expect(page).to have_link('Workshops (1)')
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
    scenario('they see can change the time zone')
    scenario('they see the day header for each day')
    scenario('they see the time slots')

    context('for each time_slot') do
      scenario('they see the start time')
      scenario('they see the duration')
      scenario('they see the session type title')
      scenario('they see a link to reveal all sessions for the time slot')
      scenario('they see the sessions for the time_slot (as a list)')

      context('for each session') do
        scenario('they see the title')
        scenario('they see the presenter')
        scenario('they see a link for all the presenters sessions')
        scenario('they see a link to the full session details')
        scenario('they can favourite a session')
        scenario('they can unfavourite a session')
      end
    end
  end
end
