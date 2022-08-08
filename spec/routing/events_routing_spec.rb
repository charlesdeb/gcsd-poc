# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/events').to route_to('events#index')
    end

    it 'routes to #show' do
      expect(get: '/events/1').to route_to('events#show', id: '1')
    end

    it 'routes to #future' do
      expect(get: '/events/future').to route_to('events#future')
    end

    it 'routes to #past' do
      expect(get: '/events/past').to route_to('events#past')
    end
  end
end
