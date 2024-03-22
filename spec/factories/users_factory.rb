FactoryBot.define do
  factory :user do
    first_name { "John" }
    last_name { "Doe" }
    sequence :email do |n|
      "user#{n}@example.com"
    end
    password { "password" }
    password_confirmation { "password" }
  end
end
