# frozen_string_literal: true

FactoryBot.define do
  factory :page do
    title { 'My Page' }
    slug  { 'my-page' }
    body { "<p>Well, hello there, I'm a page</p>" }
  end
end
