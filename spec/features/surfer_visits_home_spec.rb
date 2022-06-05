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

  scenario 'they see a list of coming events' do
    visit root_path

    expect(page).to have_text('Coming Events')
    expect(page).to have_link future_link_title, href: future_link_url
  end

  scenario 'they see a list of past events' do
    visit root_path

    expect(page).to have_text('Past Events')
    expect(page).to have_link past_link_title, href: past_link_url
  end
end
