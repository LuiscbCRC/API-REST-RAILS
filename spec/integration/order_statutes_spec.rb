# frozen_string_literal: true

require 'swagger_helper'

# Read all
describe 'Order Statuses' do
  path '/order_statuses' do
    get 'Get order status available' do
      tags 'OrderStatus'
      description 'Query all order statuses available to use as foreign key for the order.'
      produces 'application/json'

      response '200', 'Order Statuses found' do
        before { create_list(:order_status, 2) }
        run_test!
      end
    end
  end
end
