# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "bob-#{n}@example.com" }
    password { 'secret' }
    first_name { 'Bob' }
  end
end
