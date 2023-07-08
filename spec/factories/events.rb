# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    title { Faker::Lorem.unique.word }
    sequence(:slug) { |n| "my-event-#{n}" }
    starting_at { Time.zone.today.next_week }
    finishing_at { starting_at.days_since(1) }
    description { Faker::Lorem.sentence }
    is_featured { false }

    traits_for_enum :status

    trait :published do
      registration_url { Faker::Internet.url }
      status { :published }
    end

    trait :archived do
      status { :archived }
    end

    trait :draft do
      status { :draft }
    end

    factory :draft_event, traits: [:draft]
    factory :coming_soon_event, traits: [:coming_soon]
    factory :published_event, traits: [:published]
    factory :archived_event, traits: [:archived]

    factory :event_with_image do
      after(:build) do |event|
        image_name = 'some-image-100x150.png'
        image_path = File.join Rails.root, 'spec', 'factories', 'assets', 'images', image_name

        event.featured_image.attach(
          io: File.open(image_path),
          filename: image_name,
          content_type: 'image/png'
        )
      end

      factory :published_event_with_image_and_sessions, traits: [:published] do
        transient do
          sessions_count { 3 }
          time_slots_count { 3 }
        end

        after(:create) do |event, evaluator|
          time_slots = create_list :time_slot, evaluator.time_slots_count, event: event
          create_list :session_with_image_and_presenters,
                      evaluator.sessions_count,
                      event: event,
                      time_slots: [time_slots.first]
          event.reload
        end
      end
    end
  end
end
