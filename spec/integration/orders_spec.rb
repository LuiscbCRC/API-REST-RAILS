# frozen_string_literal: true

require 'swagger_helper'

describe 'Orders' do
  # Read all
  path '/orders' do
    get 'Get all orders' do
      tags 'Orders'
      description 'With this query you can get all the information about the orders that are in the database'
      produces 'application/json'

      response '200', 'Orders found' do
        before { create_list(:order, 2) }
        run_test!
      end
    end
  end

  # Search by id
  path '/orders/{id}' do
    get 'Search an order by id' do
      tags 'Orders'
      description 'Query to search a single order by passing the id of the order as parameter'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'Order found' do
        let(:order) { create(:order) }
        let(:id) { order.id }
        run_test!
      end

      response '404', 'Order not found' do
        let(:id) { -1 }
        run_test!
      end
    end
  end

  # Search by date
  path '/orders/{date}' do
    get 'Search an order by date' do
      tags 'Orders'
      description 'Query to retrieve all orders given a date. Date format must be YYYY-MM-DD'
      produces 'application/json'
      parameter name: :date, in: :path, type: :date

      response '200', 'Orders found' do
        let(:delivery_date) { build(:delivery_date, date: Time.now) }
        let(:order) { create(:order, delivery_date_id = delivery_date.id) }
        let(:date) { order.id }
        run_test!
      end

      response '404', 'Order not found' do
        let(:date) { -1 }

        run_test!
      end
    end
  end

  # Create
  path '/orders' do
    post 'Create an order' do
      tags 'Orders'
      description 'Creates an order. Note that the order needs a user to be asign. Date information is retrieved by default when status is changed.'
      consumes 'application/json'
      parameter name: :order, in: :body, schema: {
        type: :object,
        properties: {
          amount: { type: :number },
          user_id: { type: :integer },
          payment_status_id: { type: :integer },
          order_status_id: { type: :integer }
        },
        required: %w[amount user_id payment_status_id order_status_id]
      }
      produces 'application/json'

      response '201', 'Order created' do
        let(:params) { { order: attributes_for(:order) } }
        let(:order) { create(:order) }
        run_test!
      end

      response '422', 'Order creation failed for parameter missing' do
        let(:order) { { amount: 10 } }
        run_test!
      end
    end
  end

  # Update
  path '/orders/{id}' do
    put 'Update information of an order' do
      tags 'Orders'
      description 'Updates any information needed for an order. Including the request to change the payment status and order status.'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string
      parameter name: :order, in: :body, schema: {
        type: :object,
        properties: {
          amount: { type: :number },
          payment_status_id: { type: :integer },
          order_status_id: { type: :integer }
        },
        required: %w[amount payment_status_id order_status_id]
      }
      produces 'application/json'

      response '204', 'Order updated - No content returned' do
        let(:payment_status) { create(:payment_status) }
        let(:order_status) { create(:order_status) }
        let(:params) { { order: attributes_for(:order) } }
        let(:order) { create(:order) }
        let(:id) { order.id }
        run_test!
      end

      response '404', :not_found do
        let(:order) { create(:order) }
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  # Delete
  path '/orders/{id}' do
    delete 'Delete a order by id' do
      tags 'Orders'
      description 'Query to destroy a single order by passing the id of the order as parameter'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string
      produces 'application/json'

      response '204', 'Order detroyed - No content returned' do
        let(:order) { create(:order) }
        let(:id) { order.id }
        run_test!
      end

      response '404', :not_found do
        let!(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
