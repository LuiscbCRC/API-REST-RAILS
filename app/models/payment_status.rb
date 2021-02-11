# frozen_string_literal: true

class PaymentStatus < ApplicationRecord
  has_many :orders
end
