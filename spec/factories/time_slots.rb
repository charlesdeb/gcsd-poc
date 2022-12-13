# frozen_string_literal: true

FactoryBot.define do
  factory :time_slot do
    event
    starting_at { '2022-12-12 22:00:00' }
    finishing_at { '2022-12-12 22:50:00' }
  end
end
