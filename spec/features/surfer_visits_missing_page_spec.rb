# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Surfer visits missing page', type: :feature do
  scenario 'they see a 404 page' do
    visit '/glub-glub-glub'

    expect(page.status_code).to be(404)
    expect(page).to have_text("The page you were looking for doesn't exist")
  end
end
