# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Admin tries to log in' do
  let(:body) { 'Welcome to Global Creative Studio Days' }
  let(:slug) { 'home' }
  let!(:home_page) { FactoryBot.create(:page, slug: slug, body: body) }

  let(:correct_password) { 'secret_squirrel' }
  let(:wrong_password) { 'rubbish' }
  let(:email) { 'squirrel@example.com' }
  let!(:admin) do
    FactoryBot.create(
      :admin_user, first_name: 'Zaphod', last_name: 'Beeblebrox', email: email,
                   password: correct_password
    )
  end

  let(:signed_in_regexp) { /#{I18n.t('devise.sessions.signed_in')}/i }
  let(:sign_in_regexp) { /#{I18n.t('devise.sessions.new.sign_in')}/i }
  let(:sign_in_to_your_account_regexp) { /#{I18n.t('devise.sessions.new.sign_in_to_your_account')}/i }
  let(:not_signed_in_regexp) { /#{I18n.t('devise.failure.invalid', authentication_keys: 'Email')}/i }

  before(:each) do
    visit root_path
  end

  scenario 'there is a working sign in link (desktop)' do
    within('nav #desktop-menu') do
      expect(page).to have_text(sign_in_regexp)
      find('a', text: sign_in_regexp).click
    end
    expect(page).to have_text(sign_in_to_your_account_regexp)
  end

  scenario 'there is a working sign in link (mobile)' do
    within('nav #mobile-menu') do
      expect(page).to have_text(sign_in_regexp)
      find('a', text: sign_in_regexp).click
    end
    expect(page).to have_text(sign_in_to_your_account_regexp)
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
      expect(page).to have_text(sign_in_to_your_account_regexp)
      expect(page).to have_text(not_signed_in_regexp)
    end

    scenario 'is not logged in' do
      within('nav') do
        expect(page).to have_text(sign_in_regexp)
      end
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
      expect(page).to have_text(signed_in_regexp)
      expect(page).to_not have_text(not_signed_in_regexp)
    end

    scenario 'is now on the home page' do
      expect(page).to have_current_path(root_path(locale: I18n.default_locale))
    end

    scenario 'is logged in' do
      within('nav') do
        expect(page).to have_button(admin.initials)
      end
    end
  end
end
