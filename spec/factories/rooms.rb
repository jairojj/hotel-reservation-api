FactoryGirl.define do
  factory :room do
    max_quantity { Faker::Number.digit }
    daily_price { Faker::Number.decimal(2) }
    hotel_id nil
  end
end