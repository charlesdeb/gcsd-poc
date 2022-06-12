# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Surfer visits home page', type: :feature do
  let(:body) { 'Welcome to Global Creative Studio Days' }
  let(:slug) { 'home' }
  let!(:home_page) { FactoryBot.create(:page, slug: slug, body: body) }

  scenario 'they see a home page' do
    visit root_path

    # expect(page).to have_text('Welcome to Global Creative Studio Days')
    expect(page).to have_text(body)
  end

  context('featured future events') do
    let(:title) { 'Groovy Event' }
    let!(:future_featured_event) do
      FactoryBot.create(:event, starting_at: Date.today.next_week,
                                is_featured: true, title: title)
    end

    scenario 'they see a featured future event' do
      visit root_path

      expect(page).to have_text(title)
      expect(page).to have_link title, href: event_path(future_featured_event)
    end
  end

  scenario 'they see a list of past events' do
    visit root_path

    expect(page).to have_text('Past Events')
    expect(page).to have_link past_link_title, href: past_link_url
  end
end
