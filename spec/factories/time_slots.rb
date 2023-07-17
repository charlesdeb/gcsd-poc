# frozen_string_literal: true

FactoryBot.define do
  factory :time_slot do
    sequence(:title) { |n| "Time slot #{n}" }
    event
    starting_at { Time.zone.now }
    finishing_at { Time.zone.now.advance(minutes: 50) }
  end
end
