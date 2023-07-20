# frozen_string_literal: true

FactoryBot.define do
  factory :session do
    title { Faker::Lorem.unique.sentence(word_count: 3) }
    description { Faker::Lorem.sentence(word_count: 10) }
    event
    session_type

    factory :session_with_time_slots do
      transient do
        time_slots_count { 1 }
      end

      after(:create) do |session, evaluator|
        create_list(:time_slot, evaluator.time_slots_count, event: session.event, sessions: [session])
        session.reload
      end
    end

    factory :session_with_image do
      after(:build) do |session|
        image_name = 'some-image-100x150.png'
        image_path = File.join Rails.root, 'spec', 'factories', 'assets', 'images', image_name

        session.featured_image.attach(
          io: File.open(image_path),
          filename: image_name,
          content_type: 'image/png'
        )
      end

      factory :session_with_image_and_presenters do
        transient do
          presenters_count { 1 }
        end

        after(:create) do |session, evaluator|
          create_list :presenter_with_bio, evaluator.presenters_count, sessions: [session]
          session.reload
        end
      end
    end
  end
end
