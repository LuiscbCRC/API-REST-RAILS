# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

OrderStatus.delete_all
PaymentStatus.delete_all

OrderStatus.create(status: 'Recibido')
OrderStatus.create(status: 'En Preparación')
OrderStatus.create(status: 'En Reparto')
OrderStatus.create(status: 'Entregada')

PaymentStatus.create(status: 'Pendiente de Pago')
PaymentStatus.create(status: 'No Pagada')
PaymentStatus.create(status: 'Pagada')
