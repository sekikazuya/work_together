FactoryBot.define do
  factory :company do
    name {Faker::Company.name}
    name_kana {'カブシキガイシャ'}
    sector_id { Faker::Number.between(from: 1, to: 10) }
    industry_id { Faker::Number.between(from: 1, to: 15) }
    profile {Faker::Lorem.sentence}
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city {'仕事市0-00-0'}
    building_name {'一緒ハイツ'}
    phone {'01234567890'}
    business_hours {Faker::Lorem.sentence}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end