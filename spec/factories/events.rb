# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    title { 'My Event' }
    starting_at { Date.today.next_week }
    status { :published }
    description { 'Some event information' }
    is_featured { false }
  end
end
