FactoryGirl.define do
  factory :hotel do
    name { Faker::Company.name }
    localization { Faker::Address.city }
  end
end