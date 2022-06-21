# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    title { 'My Event' }
    sequence(:slug) { |n| "my-event-#{n}" }
    starting_at { Date.today.next_week }
    finishing_at { Date.today.next_week }
    status { :published }
    description { 'Some event information' }
    is_featured { false }
  end
end
