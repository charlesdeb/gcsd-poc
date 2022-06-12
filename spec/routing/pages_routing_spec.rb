# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PagesController, type: :routing do
  describe 'routing' do
    it 'routes / to pages#home' do
      expect(get: '/').to route_to(
        controller: 'pages', action: 'home', slug: 'home'
      )
    end

    it 'routes /a-page to pages#show' do
      expect(get: '/a-page').to route_to(
        controller: 'pages', action: 'show', slug: 'a-page'
      )
    end
  end
end
