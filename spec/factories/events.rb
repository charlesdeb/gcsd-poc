# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    title { 'My Event' }
    sequence(:slug) { |n| "my-event-#{n}" }
    starting_at { Time.zone.today.next_week }
    finishing_at { Time.zone.today.next_week }
    status { :published }
    description { 'Some event information' }
    is_featured { false }

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
    end
  end
end
