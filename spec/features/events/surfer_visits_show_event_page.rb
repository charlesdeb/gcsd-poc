# frozen_string_literal: true

require 'rails_helper'

# xxrubocop:disable Metrics/BlockLength

RSpec.feature 'Surfer visits show event', type: :feature do # rubocop:disable Metrics/BlockLength
  let(:title) { 'Groovy Event' }
  let(:description) { 'Some stuff about anevent' }
  let(:event) do
    FactoryBot.create(:event, starting_at: Date.today.next_week,
                              title: title, description: description)
  end

  before(:each) do
    visit event_path event
  end

  context('general event details') do
    scenario 'they see the title' do
      within('div.event-header') do
        expect(page).to have_text(title)
      end
    end
    
    scenario 'they see the description'
    scenario 'they see the picture'
    scenario 'they see the dates in their current time zone'
    scenario 'they see a donate button'
    scenario 'they see a register button'
  end

  context('actions') do
    scenario('they can donate to the event')
    scenario('they can register for the event')
  end

  context('summary information') do
    scenario('they the session types (in a tab control)')

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

    context('for each timeslot') do
      scenario('they see the start time')
      scenario('they see the duration')
      scenario('they see the session type title')
      scenario('they see a link to reveal all sessions for the time slot')
      scenario('they see the sessions for the timeslot (as a list)')

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
