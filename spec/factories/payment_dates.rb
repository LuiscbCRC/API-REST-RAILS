# frozen_string_literal: true

FactoryBot.define do
  factory :payment_date do
    date { Faker::Date.between(from: '2018-09-23', to: '2021-02-10') }
  end
end
