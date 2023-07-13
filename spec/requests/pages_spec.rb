# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Pages', type: :request do
  describe 'GET /show' do
    it 'returns http success' do
      slug = 'about'
      create(:page, slug: slug)

      get "/#{slug}"

      expect(response).to have_http_status(:success)
    end
  end
end
