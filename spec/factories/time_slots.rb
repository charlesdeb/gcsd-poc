# frozen_string_literal: true

FactoryBot.define do
  factory :time_slot do
    sequence(:title) { |n| "Time slot #{n}" }
    event
    starting_at { Time.zone.now }
    finishing_at { Time.zone.now.advance(minutes: 50) }

    factory :time_slot_with_sessions do
      transient do
        sessions_count { 3 }
      end

      after(:create) do |time_slot, evaluator|
        create_list(:session_with_image_and_presenters,
                    evaluator.sessions_count,
                    event: time_slot.event,
                    time_slots: [time_slot])
        time_slot.reload
      end
    end
  end
end
