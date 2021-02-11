# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  belongs_to :payment_status
  belongs_to :order_status
  belongs_to :delivery_date
  belongs_to :payment_date

  validates_presence_of :user
end
