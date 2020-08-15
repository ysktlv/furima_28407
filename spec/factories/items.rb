FactoryBot.define do
  factory :item do
    name              { "switch" }
    price             { 30_000 }
    text              { "switch" }
    category_id       { 2 }
    condition_id      { 2 }
    shipping_fee_id   { 2 }
    shipping_area_id  { 2 }
    shipping_day_id   { 2 }
    association :user
  end
end
