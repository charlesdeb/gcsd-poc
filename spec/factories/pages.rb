# frozen_string_literal: true

FactoryBot.define do
  factory :page do
    title { Faker::Lorem.unique.sentence(word_count: 3) }
    slug  { 'my-page' }
    body { "<p>#{Faker::Lorem.sentence(word_count: 15)}</p>" }
  end
end
