# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Admin tries to log in', type: :feature do # rubocop:disable Metrics/BlockLength
  let(:body) { 'Welcome to Global Creative Studio Days' }
  let(:slug) { 'home' }
  let!(:home_page) { FactoryBot.create(:page, slug: slug, body: body) }

  let(:correct_password) { 'secret_squirrel' }
  let(:wrong_password) { 'rubbish' }
  let(:email) { 'squirrel@example.com' }
  let!(:admin) { FactoryBot.create(:admin_user, email: email, password: correct_password) }

  before(:each) do
    visit root_path
  end

  scenario 'there is a working sign in link' do
    expect(page).to have_text(I18n.t('devise.shared.links.sign_in'))
    click_link I18n.t('devise.shared.links.sign_in')
    expect(page).to have_text(I18n.t('devise.sessions.new.sign_in_to_your_account'))
  end

  # This is mostly just testing that devise works - which is a bit redundant
  context('with a bad password') do
    before(:each) do
      visit new_user_session_path
      fill_in I18n.t('activerecord.attributes.user.email'), with: email
      fill_in I18n.t('activerecord.attributes.user.password'), with: wrong_password
      click_button I18n.t('devise.shared.links.sign_in')
    end

    scenario 'sees failure message' do
      expect(page).to have_text(I18n.t('devise.sessions.new.sign_in_to_your_account'))
      # TODO: find the devise text key for this
      expect(page).to have_text('Invalid Email or password.')
    end

    scenario 'is not logged in' do
      skip 'add something that only shows when a user is logged in'
    end
  end

  # This is mostly just testing that devise works - which is a bit redundant
  context('with a good password') do
    before(:each) do
      visit new_user_session_path
      fill_in I18n.t('activerecord.attributes.user.email'), with: email
      fill_in I18n.t('activerecord.attributes.user.password'), with: correct_password
      click_button I18n.t('devise.shared.links.sign_in')
    end

    scenario 'sees signed in message' do
      expect(page).to have_text('Signed in successfully.')
      expect(page).to_not have_text('Invalid Email or password.')
    end

    scenario 'is now on the home page' do
      expect(page).to have_current_path(root_path(locale: I18n.default_locale))
    end

    scenario 'is logged in' do
      skip 'add something that only shows when a user is logged in'
    end
  end
end
