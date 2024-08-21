FactoryBot.define do
  factory :comment do
    body { Faker::Lorem.paragraph }
    association :user
    association :commentable, factory: :post

    trait :with_like do
      after(:create) do |comment|
        create(:like, user: comment.user, likeable: comment)
      end
    end
  end
end
