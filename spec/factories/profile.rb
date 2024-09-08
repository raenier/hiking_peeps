FactoryBot.define do
  factory :profile do
    description { Faker::Lorem.sentence }
    gender { %w[male female].sample }
    bday { Faker::Date.birthday(min_age: 18, max_age: 65) }
    address { Faker::Address.full_address }
  end
end
