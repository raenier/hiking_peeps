FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    second_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    password_confirmation { password }
  end
end
