# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Surfer visits normal pages', type: :feature do
  let(:body) { 'This is the about page' }
  let(:slug) { 'about' }
  let(:meta_description) { 'SEO-friendly meta info for the about page' }
  let!(:about_page) do
    create(
      :page, slug: slug, body: body,
             title: 'About', meta_description: meta_description
    )
  end

  context('A real page') do
    before(:each) do
      visit '/about'
    end

    scenario 'they see the page content' do
      expect(page).to have_text(body)
    end

    scenario 'they see the right title' do
      expect(page.title).to include(about_page.title)
    end

    scenario 'they see description in the page meta' do
      find("head meta[name='description'][content='#{meta_description}']", visible: false)
    end
  end

  scenario 'they see a 404 page for an unknown page ' do
    visit '/glub-glub-glub'

    expect(page.status_code).to be(404)

    expect(page).to have_title(I18n.t('page_not_found'))
    expect(page).to have_text("The page you're looking for doesn't exist")
  end
end
