# frozen_string_literal: true

FactoryBot.define do
  factory :session do
    title { Faker::Lorem.unique.sentence(word_count: 3) }
    description { Faker::Lorem.sentence(word_count: 10) }
    time_slot
    event
    session_type

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
    end
  end
end
