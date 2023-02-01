# frozen_string_literal: true

FactoryBot.define do
  factory :session do
    title { Faker::Lorem.unique.sentence(word_count: 3) }
    description { Faker::Lorem.sentence(word_count: 10) }
    time_slot
    event
    session_type
  end
end
