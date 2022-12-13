# frozen_string_literal: true

FactoryBot.define do
  factory :session do
    title { 'Art for Fun' }
    description { 'A great workshop' }
    time_slot
    event
    session_type
  end
end
