FactoryBot.define do
  factory :session_type do
    name { "My Session type" }
    description { "Description of a session type" }
    order_by { 10 }
  end
end
