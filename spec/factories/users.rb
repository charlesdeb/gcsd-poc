# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "bob-#{n}@example.com" }
    password { 'secret' }
    first_name { 'Bob' }

    trait :admin do
      role { :admin }
    end

    factory :admin_user, traits: [:admin]

    # confirm the user - as per devise
    after(:create) do |user|
      user.confirm
      user.save
    end
  end
end
