# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Surfer visits contact us page' do
  before(:each) do
    visit new_contact_form_path
  end

  scenario 'they see a contact form' do
    within('form') do
      expect(page).to have_field('contact_form[first_name]')
      expect(page).to have_field('contact_form[last_name]')
      expect(page).to have_field('contact_form[email]')
      expect(page).to have_field('contact_form[message]')
    end
  end

  scenario 'they see the right title' do
    expect(page.title).to include('Contact Us')
  end

  context('user fills out some stuff')
end
