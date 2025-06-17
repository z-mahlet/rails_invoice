FactoryBot.define do
  factory :invoice do
    sequence(:invoice_number) { |n| "INV#{n}" }
    generated_on { Date.today }
    status { :pending }
    association :customer
  end
end