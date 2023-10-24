# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Crawler visits site' do
  context('pages') do
    let(:body) { 'This is the about page' }
    let(:slug) { 'about' }
    let!(:about_page) { create(:page, slug: slug, body: body, title: 'About') }

    scenario 'sitemap has about page' do
      visit '/sitemap'

      expect(page).to have_selector('loc', text: 'example.com/en/about')
    end
  end

  context('events') do
    before(:each) do
      # the sitemap expects there to be at least one page on the site
      create(:page)
    end

    scenario('sitemap has publicly viewable event') do
      event = FactoryBot.create(
        :published_event,
        starting_at: Time.zone.now
      )

      visit '/sitemap'

      expect(page).to have_selector('loc', text: "events/#{event.slug}")
    end

    scenario('sitemap does not have non-publicly viewable events') do
      event = FactoryBot.create(
        :draft_event,
        starting_at: Time.zone.now
      )

      visit '/sitemap'

      expect(page).to_not have_selector('loc', text: "events/#{event.slug}")
    end
  end

  context('sessions') do
    before(:each) do
      # the sitemap requires there to be at least one page on the site
      create(:page)
    end

    scenario('sitemap has an event\'s sessions') do
      event = FactoryBot.create(
        :published_event_with_image_and_sessions,
        starting_at: Time.zone.now
      )

      visit '/sitemap'

      event.sessions.each do |session|
        expect(page).to have_selector('loc', text: "sessions/#{session.slug}")
      end
    end
  end
end
