FactoryBot.define do
  factory :item do
    id                 {Faker::Number.between(from: 1, to: 100)}
    name               { Faker::Name.initials(number: 2) }
    explanation        { Faker::Lorem.sentence }
    category_id        { Faker::Number.between(from: 2, to: 11) }
    status_id          { Faker::Number.between(from: 2, to: 7) }
    fee_id             { Faker::Number.between(from: 2, to: 3) }
    prefectures_id     { Faker::Number.between(from: 2, to: 48) }
    send_out_date_id   { Faker::Number.between(from: 2, to: 4) }
    price              { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
