# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :routing do
  let(:default_locale) { I18n.locale }

  describe 'routing' do
    # gives us access to the response variable
    # see https://stackoverflow.com/questions/10842448/do-routing-specs-support-redirect-routes-rspec
    include RSpec::Rails::RequestExampleGroup

    it 'routes to #index for given time_slot' do
      time_slot = FactoryBot.create(:time_slot)

      expect(get: "/sessions/by_time_slot/#{time_slot.id}").to route_to(
        controller: 'sessions', action: 'index', time_slot: time_slot.id.to_s
      )
    end

    it 'routes to #index for given session_type and event' do
      event = FactoryBot.create(:published_event_with_image_and_sessions)
      session_type = event.sessions.first.session_type

      expect(get: "/sessions/by_event/#{event.id}/by_type/#{session_type.id}").to route_to(
        controller: 'sessions', action: 'index', event: event.id.to_s, session_type: session_type.id.to_s
      )
    end
  end
end
