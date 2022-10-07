FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    description { Faker::Lorem.sentence }
    status_condition_id { Faker::Number.between(from: 1, to: 6) }
    prefecture_id { Faker::Number.between(from: 1, to: 2) }
    shipping_charges_id { Faker::Number.between(from: 1, to: 2) }
    shipping_days_id == shipping_date{ Faker::Number.between(from: 1, to: 3) }
    shipping_price { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id { Faker::Number.between(from: 1, to: 10) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
