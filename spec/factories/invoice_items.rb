FactoryBot.define do
  factory :invoice_item do
    association :invoice
    association :item
    quantity { 1.0 }
    price { 10.0 }
  end
end