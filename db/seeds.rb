# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'faker'

Order.delete_all
OrderStatus.delete_all
PaymentStatus.delete_all
User.delete_all
PaymentDate.delete_all
DeliveryDate.delete_all

OrderStatus.create(status: 'Recibido')
OrderStatus.create(status: 'En Preparación')
OrderStatus.create(status: 'En Reparto')
OrderStatus.create(status: 'Entregada')

PaymentStatus.create(status: 'Pendiente de Pago')
PaymentStatus.create(status: 'No Pagada')
PaymentStatus.create(status: 'Pagada')

10.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email)
end

20.times do
  Order.create(
    amount: Faker::Number.decimal(l_digits: 2),
    user: User.limit(1).order('RANDOM()').first,
    order_status: OrderStatus.limit(1).order('RANDOM()').first,
    payment_status: PaymentStatus.limit(1).order('RANDOM()').first
  )
end
