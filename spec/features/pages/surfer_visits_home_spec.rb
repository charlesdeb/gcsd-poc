# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Surfer visits home page', type: :feature do
  let(:body) { 'Welcome to Global Creative Studio Days' }
  let(:slug) { 'home' }
  let!(:home_page) { FactoryBot.create(:page, slug: slug, body: body) }

  scenario 'they see a home page' do
    visit root_path

    expect(page).to have_text(body)
  end

  context('there are future events') do
    let(:future_featured_title) { 'Groovy Future Featured Event' }
    let(:future_featured_description) { 'Some stuff about a future featured event' }
    let(:future_title) { 'Groovy Future Event' }
    let!(:future_featured_event) do
      FactoryBot.create(:event, starting_at: Time.zone.today.next_week,
                                is_featured: true, title: future_featured_title,
                                description: future_featured_description)
    end

    let!(:future_event) do
      FactoryBot.create(:event, starting_at: Time.zone.today.next_week,
                                is_featured: false, title: future_title)
    end

    context('there are featured events') do
      scenario 'they see a featured future event' do
        visit root_path

        expect(page).to have_text(future_featured_title)
        expect(page).to have_text(future_featured_description)
      end

      scenario 'they see links to see more of the featured event' do
        visit root_path

        expect(page).to have_link future_featured_title, href: event_path(I18n.default_locale, future_featured_event)
        expect(page).to have_link I18n.t('events.event_summary.more'),
                                  href: event_path(I18n.default_locale, future_featured_event)
      end
    end

    scenario 'they see a link for future events' do
      visit root_path

      expect(page).to have_link 'Coming Events', href: future_events_path(locale: I18n.default_locale)
    end
  end

  context('there are no future events') do
    scenario 'they see no link for future events' do
      visit root_path

      expect(page).not_to have_link 'Coming Events', href: future_events_path(locale: I18n.default_locale)
    end
  end

  context('there are past events') do
    let(:past_title) { 'Groovy Past Event' }
    let!(:past_event) do
      FactoryBot.create(
        :event,
        starting_at: Time.zone.today.last_week,
        finishing_at: Time.zone.today.last_week.days_since(1),
        title: past_title
      )
    end

    scenario 'they see a link to past events' do
      visit root_path
      expect(page).to have_link 'Past Events', href: past_events_path(locale: I18n.default_locale)
    end

    skip 'they see a list of past events' do
      visit root_path
    end
  end
end
