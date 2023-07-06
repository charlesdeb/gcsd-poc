# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Surfer plays with i18n stuff', type: :system, js: true do
  # stuff for an event
  let(:title) { 'Groovy Event' }
  let(:description) { 'Some stuff about an event' }
  let(:event) do
    FactoryBot.create(:event, starting_at: Time.zone.now,
                              title: title, description: description)
  end

  # time zone stuff
  let(:default_time_zone) { 'Europe/London' }
  let(:new_time_zone) { 'Asia/Singapore' }

  context 'default timezone' do
    before(:each) do
      # this page has i18n stuff on it
      visit event_path :en, event
    end

    scenario 'timezone cookie is set to the default' do
      time_zone_cookie = get_me_the_cookie('gcsd_timezone')
      expect(time_zone_cookie[:value]).to eq(default_time_zone)
    end

    scenario 'they see the start date in the default time zone' do
      within('div.overview') do
        expected_date_string = I18n.l(
          event.starting_at.in_time_zone(default_time_zone),
          format: :starting_at
        ).strip
        find(:xpath, ".//time[text()='#{expected_date_string}']")
      end
    end
  end

  context 'surfer changes timezone' do
    before(:each) do
      # this page has i18n stuff on it
      visit event_path :en, event
    end

    scenario 'timezone cookie is set to the new value' do
      within('nav#main-menu') do
        select new_time_zone, from: 'time-zone'
      end

      time_zone_cookie = get_me_the_cookie('gcsd_timezone')

      expect(time_zone_cookie[:value]).to eq(new_time_zone)
    end

    scenario 'timezone cookie is remembered across pages' do
      within('nav#main-menu') do
        select new_time_zone, from: 'time-zone'
      end

      # change pages
      visit root_path
      visit event_path :en, event

      time_zone_cookie = get_me_the_cookie('gcsd_timezone')

      expect(time_zone_cookie[:value]).to eq(new_time_zone)
    end

    scenario 'they see the start date in a different time zone' do
      time_zone_cookie = get_me_the_cookie('gcsd_timezone')

      expect(time_zone_cookie[:value]).to eq(default_time_zone)

      within('nav#main-menu') do
        select new_time_zone, from: 'time-zone'
      end

      within('div.overview') do
        expected_date_string = I18n.l(
          event.starting_at.in_time_zone(new_time_zone),
          format: :starting_at
        ).strip

        find(:xpath, ".//time[text()='#{expected_date_string}']")
      end
    end
  end
end
