# frozen_string_literal: true

FactoryBot.define do
  factory :session_type do
    sequence(:name) { |n| "Session type: #{n}" }
    description { 'Description of a session type' }
    order_by { 10 }
  end
end
