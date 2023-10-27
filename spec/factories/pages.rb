# frozen_string_literal: true

FactoryBot.define do
  factory :page do
    title { Faker::Lorem.unique.sentence(word_count: 3) }
    sequence(:slug) { |n| "my-page-#{n}" }
    body { "<p>#{Faker::Lorem.sentence(word_count: 15)}</p>" }

    factory :page_with_image do
      after(:build) do |page|
        image_name = 'some-image-100x150.png'
        image_path = File.join Rails.root, 'spec', 'factories', 'assets', 'images', image_name

        page.featured_image.attach(
          io: File.open(image_path),
          filename: image_name,
          content_type: 'image/png'
        )
      end
    end
  end
end
