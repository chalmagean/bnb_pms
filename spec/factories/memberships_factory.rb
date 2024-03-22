FactoryBot.define do
  factory :membership do
    user
    account

    trait :admin do
      role { "admin" }
    end
  end
end
