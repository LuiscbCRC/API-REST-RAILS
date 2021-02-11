# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    amount { Faker::Number.decimal(l_digits: 2) }
    payment_status
    order_status
    user
  end
end
