FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    second_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    password_confirmation { password }

    trait :with_posts do
      after(:create) do |user|
        create_list(:post, 2, user:)
      end
    end

    trait :with_followed_posts do
      after(:create) do |user|
        user.follow(create(:user, :with_posts))
      end
    end
  end
end
