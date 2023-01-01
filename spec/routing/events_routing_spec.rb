# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventsController, type: :routing do
  let(:default_locale) { I18n.locale }
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/events').to route_to(
        controller: 'events', action: 'index', locale: default_locale
      )
    end

    it 'routes to #index for future events' do
      expect(get: '/future_events').to route_to(
        controller: 'events', action: 'index', scope: 'future'
      )
    end

    it 'routes to #index for past events' do
      expect(get: '/past_events').to route_to(
        controller: 'events', action: 'index', scope: 'past'
      )
    end

    it 'routes to #show' do
      expect(get: '/events/1').to route_to(
        controller: 'events', action: 'show', id: '1', locale: default_locale
      )
    end
  end
end
