FactoryBot.define do
  factory :order_address do
    postal_code       { "123-4567" }
    prefecture        { 2 }
    city              { "横浜市" }
    house_number      { "青山1-1" }
    building_number   { "" }
    phone_number      { "09012345678" }
  end
end
