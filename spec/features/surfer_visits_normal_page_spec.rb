# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Surfer visits normal pages', type: :feature do
  let(:body) { 'This is the about page' }
  let(:slug) { 'about' }
  let!(:about_page) { create(:page, slug: slug, body: body) }

  scenario 'they see the page content' do
    visit '/about'

    expect(page).to have_text(body)
  end

  scenario 'they see a 404 page for an uknown page ' do
    visit '/glub-glub-glub'

    expect(page.status_code).to be(404)
    expect(page).to have_text("The page you were looking for doesn't exist")
  end
end
