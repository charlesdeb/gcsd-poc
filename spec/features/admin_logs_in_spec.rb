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
    # TODO: figure out translation. This gem might help for devise: https://github.com/tigrish/devise-i18n
    expect(page).to have_text('Sign In')
    click_link 'Sign In'
    expect(page).to have_text('Sign in to your account')
  end

  # TODO: this is just testing that devise works - which is redundant
  context('with a bad password') do
    before(:each) do
      visit new_user_session_path
      fill_in 'Email Address', with: email
      fill_in 'Password', with: wrong_password
      click_button 'Sign In'
    end

    scenario 'sees failure message' do
      expect(page).to have_text('Sign in to your account')
      expect(page).to have_text('Invalid Email or password.')
    end

    scenario 'is not logged in' do
      skip 'add something that only shows when a user is logged in'
    end
  end

  # TODO: this is mostly just testing that devise works - which is redundant
  context('with a good password') do
    before(:each) do
      visit new_user_session_path
      fill_in 'Email Address', with: email
      fill_in 'Password', with: correct_password
      click_button 'Sign In'
    end

    scenario 'sees signed in message' do
      expect(page).to have_text('Signed in successfully.')
      expect(page).to_not have_text('Invalid Email or password.')
    end

    scenario 'is now on the home page' do
      expect(page).to have_current_path(root_path)
    end

    scenario 'is logged in' do
      skip 'add something that only shows when a user is logged in'
    end
  end
end
