# frozen_string_literal: true

require 'swagger_helper'

# Read all
describe 'Payment Statuses' do
  path '/payment_statuses' do
    get 'Get payment status available' do
      tags 'PaymentStatus'
      description 'Query all payment statuses available to use as foreign key for the order.'
      produces 'application/json'

      response '200', 'Payment Statuses found' do
        before { create_list(:payment_status, 2) }
        run_test!
      end
    end
  end
end
