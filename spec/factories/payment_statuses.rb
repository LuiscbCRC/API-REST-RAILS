# frozen_string_literal: true

FactoryBot.define do
  factory :payment_status do
    status { Faker::Lorem.word }
  end
end
