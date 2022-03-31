FactoryBot.define do
  factory :item do
    goods_name      {Faker::Lorem.word}
    explanation     {Faker::Lorem.word}
    category_id     {Faker::Number.between(from: 2, to: 11)}
    condition_id    {Faker::Number.between(from: 2, to: 7)}
    delivery_id     {Faker::Number.between(from: 2, to: 3)}
    prefecture_id   {Faker::Number.between(from: 2, to: 48)}
    shipping_day_id {Faker::Number.between(from: 2, to: 4)}
    price           {Faker::Number.within(range: 300..9_999_999)}

    after(:build) do |item|
      item.image.attach(io: File.open('public/image/test_image.png'), filename: 'test_image.png')
    end
    association :user
  end
end
