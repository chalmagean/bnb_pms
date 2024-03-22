FactoryBot.define do
  factory :property do
    name { "Property Name" }
    address { "Addr." }
    sequence :email do |n|
      "property#{n}@example.com"
    end
    city { "San Francisco" }
    country { "USA" }
    account
  end
end
