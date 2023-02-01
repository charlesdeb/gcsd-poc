FactoryBot.define do
  factory :presenter do
    name { Faker::Name.unique.name }

    factory :presenter_with_bio_and_image do
      after(:build) do |event|
        event.bio = Faker::Lorem.sentence(word_count: 15)
        image_name = 'presenter.png'
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
