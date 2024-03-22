FactoryBot.define do
  factory :account do
    name { "Account Name" }
    address { "Addr." }
    sequence :email do |n|
      "account#{n}@example.com"
    end
    city { "San Francisco" }
    country { "USA" }
  end
end
