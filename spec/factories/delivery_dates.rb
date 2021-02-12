
FactoryBot.define do
  factory :delivery_date do
    date { Faker::Date.between(from: '2018-09-23', to: '2021-02-10') }
  end
end