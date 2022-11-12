# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Surfer visits show event', type: :feature do # rubocop:disable Metrics/BlockLength
  let(:title) { 'Groovy Event' }
  let(:description) { 'Some stuff about an event' }
  let(:event) do
    FactoryBot.create(:event, starting_at: Time.zone.now,
                              title: title, description: description)
  end

  before(:each) do
    # p event
    # TODO: refactor into a helper
    image_name = 'some-image-100x150.png'
    image_path = File.join Rails.root, 'spec', 'factories', 'assets', 'images', image_name

    event.featured_image.attach(
      io: File.open(image_path),
      filename: image_name,
      content_type: 'image/png'
    )
    visit event_path event
  end

  context('overview of event') do
    scenario 'they see the title' do
      within('div.event-overview') do
        expect(page).to have_text(title)
      end
    end

    scenario 'they see the description' do
      within('div.event-overview') do
        expect(page).to have_text(description)
      end
    end

    scenario 'they see the picture' do
      within('div.event-overview') do
        expect(page).to have_css("img[alt='#{title}']")
      end
    end

    scenario 'they see the start date in their current time zone' do
      within('div.event-overview') do
        expect(page).to have_content(I18n.l(event.starting_at, format: :short).strip)
      end
    end
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
