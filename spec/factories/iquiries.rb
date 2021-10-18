FactoryBot.define do
  factory :iquiry do
    message {Faker::Lorem.sentence}
    association :user
    association :room

    after(:build) do |iquiry|
      iquiry.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end