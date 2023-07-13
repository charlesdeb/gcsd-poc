# frozen_string_literal: true

FactoryBot.define do
  factory :contact_form do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    message { Faker::Lorem.sentence }
  end
end
