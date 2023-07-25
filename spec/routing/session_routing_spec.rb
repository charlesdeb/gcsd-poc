# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :routing do
  let(:default_locale) { I18n.locale }

  describe 'routing' do
    # gives us access to the response variable
    # see https://stackoverflow.com/questions/10842448/do-routing-specs-support-redirect-routes-rspec
    include RSpec::Rails::RequestExampleGroup

    it 'redirects to home' do
      get('/sessions')
      expect(response).to redirect_to("/#{default_locale}")
    end

    it 'routes to #index for given time_slot' do
      time_slot = FactoryBot.create(:time_slot)
      expect(get: "/sessions/by_time_slot/#{time_slot.id}").to route_to(
        controller: 'sessions', action: 'index', time_slot: time_slot.id.to_s
      )
    end
  end
end
