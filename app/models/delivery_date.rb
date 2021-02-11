# frozen_string_literal: true

class DeliveryDate < ApplicationRecord
  has_many :orders
end
