# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'bob@example.com' }
    password { 'secret' }
    first_name { 'Bob' }
  end
end
