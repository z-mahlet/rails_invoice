FactoryBot.define do
  factory :item do
    sequence(:code) { |n| "ITEM#{n}" }
    name { "Test Item" }
  end
end