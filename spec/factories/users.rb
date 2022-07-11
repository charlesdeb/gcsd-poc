# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'bob@example.com' }
    password { 'secret' }
  end
end
