# frozen_string_literal: true

FactoryBot.define do
  factory :session_type do
    sequence(:name) { |n| "Session type: #{n}" }
    description { Faker::Lorem.sentence(word_count: 5) }
    order_by { 10 }
  end
end
