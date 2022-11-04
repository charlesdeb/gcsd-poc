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

    it 'routes to #show' do
      expect(get: '/events/1').to route_to(
        controller: 'events', action: 'show', id: '1', locale: default_locale
      )
    end

    it 'routes to #future' do
      expect(get: '/events/future').to route_to(
        controller: 'events', action: 'future', locale: default_locale
      )
    end

    it 'routes to #past' do
      expect(get: '/events/past').to route_to(
        controller: 'events', action: 'past', locale: default_locale
      )
    end
  end
end
