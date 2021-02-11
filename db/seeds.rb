# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

require 'faker'

User.delete_all
Order.delete_all
PaymentDate.delete_all
PaymentStatus.delete_all
OrderStatus.delete_all
DeliveryDate.delete_all
