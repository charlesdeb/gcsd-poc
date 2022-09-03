# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Admin logs in', type: :feature do # rubocop:disable Metrics/BlockLength
  let(:body) { 'Welcome to Global Creative Studio Days' }
  let(:slug) { 'home' }
  let!(:home_page) { FactoryBot.create(:page, slug: slug, body: body) }

  let(:password) { 'secret_squirrel' }
  let!(:admin) { FactoryBot.create(:admin_user, password: password) }

  before(:each) do
    visit root_path
  end

  scenario 'they see a sign in link' do
    # TODO: figure out translation. This gem might help for devise: https://github.com/tigrish/devise-i18n
    expect(page).to have_text('Sign In')
  end

  context('with a bad password') do
  end

  context('with a good password') do # rubocop:disable Metrics/BlockLength
    let(:future_featured_title) { 'Groovy Future Featured Event' }
    let(:future_featured_description) { 'Some stuff about a future featured event' }
    let(:future_title) { 'Groovy Future Event' }
    let!(:future_featured_event) do
      FactoryBot.create(:event, starting_at: Date.today.next_week,
                                is_featured: true, title: future_featured_title,
                                description: future_featured_description)
    end

    let!(:future_event) do
      FactoryBot.create(:event, starting_at: Date.today.next_week,
                                is_featured: false, title: future_title)
    end

    context('featured event') do
      scenario 'they see a featured future event' do
        visit root_path

        expect(page).to have_text(future_featured_title)
        expect(page).to have_text(future_featured_description)
      end

      scenario 'they see links to see more of the featured event' do
        visit root_path

        expect(page).to have_link future_featured_title, href: event_path(future_featured_event)
        # expect(page).to have_link I18n.t('more'), href: event_path(future_featured_event)
        expect(page).to have_link 'More', href: event_path(future_featured_event)
      end
    end

    scenario 'they see a link for future events' do
      visit root_path

      expect(page).to have_link 'Coming Events', href: future_events_path
    end
  end

  context('no future events') do
    scenario 'they see no link for future events' do
      visit root_path

      expect(page).not_to have_link 'Coming Events', href: future_events_path
    end
  end

  context('past events') do
    let(:past_title) { 'Groovy Past Event' }
    let!(:past_event) do
      FactoryBot.create(:event, finishing_at: Date.today.last_week,
                                title: past_title)
    end

    scenario 'they see a link to past events' do
      visit root_path

      expect(page).to have_link 'Past Events', href: past_events_path
    end

    skip 'they see a list of past events' do
      visit root_path
    end
  end
end
