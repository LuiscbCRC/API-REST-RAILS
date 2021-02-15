# frozen_string_literal: true

class User < ApplicationRecord
  has_many :orders, dependent: :destroy
  validates :email, uniqueness: { case_sensitive: true }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_presence_of :email
  accepts_nested_attributes_for :orders, allow_destroy: true
end
