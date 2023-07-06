# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ContactForms', type: :request do
  describe 'POST /create' do
    it 'returns http success' do
      form_params =
        { contact_form:
         {
           first_name: Faker::Name.first_name,
           last_name: Faker::Name.last_name,
           email: Faker::Internet.email,
           message: Faker::Lorem.sentence(word_count: 15)
         } }

      post '/contact_form',
           :params => form_params.to_json,
           :headers => { 'Content-Type': 'application/json' }
      expect(response).to have_http_status(:redirect)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/contact_form/new'
      expect(response).to have_http_status(:success)
    end
  end
end
