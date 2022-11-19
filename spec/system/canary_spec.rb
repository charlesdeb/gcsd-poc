# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Tester visits a few pages', type: :system do
  let(:body) { 'Welcome to Global Creative Studio Days' }
  let(:slug) { 'home' }
  let!(:home_page) { FactoryBot.create(:page, slug: slug, body: body) }

  scenario 'they see a home page' do
    visit root_path

    expect(page).to have_text(body)
  end
end
