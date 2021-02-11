# frozen_string_literal: true

class User < ApplicationRecord
  has_many :orders
  validates :email, uniqueness: { case_sensitive: true }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_presence_of :email
end
