
FactoryBot.define do
  factory :order_status do
    status { Faker::Lorem.word }
  end
end