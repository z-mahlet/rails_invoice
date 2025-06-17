FactoryBot.define do
  factory :customer do
    sequence(:code) { |n| "CUST#{n}" }
    name { "Test Customer" }
  end
end