# frozen_string_literal: true

class PaymentDate < ApplicationRecord
  has_many :orders
end
