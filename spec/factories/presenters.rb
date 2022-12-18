FactoryBot.define do
  factory :presenter do
    name { 'Billy Bob' }

    factory :presenter_with_bio_and_image do
      after(:build) do |event|
        event.bio = 'Loves to eat curry by the beach'
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
