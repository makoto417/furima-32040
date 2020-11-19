FactoryBot.define do
  factory :order_address do
    postcode        { '123-4567' }
    prefectures_id  { Faker::Number.between(from: 2, to: 48) }
    address_city    { Gimei.city.kanji }
    address_line1   { Gimei.town.kanji }
    address_line2   { Faker::Number.number(digits: 3) }
    phone_number     { Faker::Number.number(digits: 10) }
  end
end