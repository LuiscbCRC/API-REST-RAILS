# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Orders', type: :request do
  # initialize test data
  let!(:order_statuses) { create_list(:order_status, 10) }
  let!(:payment_statuses) { create_list(:payment_status, 10) }
  let!(:orders) { create_list(:order, 10) }

  # Test suite for GET /orders/:id
  describe 'GET /orders/:id' do
    before { get "/orders/#{orders[1].id}" }

    context 'when the record exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:id) { 100 }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  # Test suite for POST /orders
  describe 'POST /orders' do
    # valid payload
    let(:valid_attributes) { { amount: 29.21, order_status_id: 2, payment_status_id: 1 } }

    context 'when the request is valid' do
      before { post '/orders', params: valid_attributes }
    end

    context 'when the request is invalid' do
      before { post '/orders', params: { amount: 29.21, order_status_id: 2, payment_status_id: 1 } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  # Test suite for PUT /orders/:id
  describe 'PUT /orders/:id' do
    let(:valid_attributes) { { name: 'Shopping' } }

    context 'when the record exists' do
      before { put "/orders/#{orders[1].id}", params: valid_attributes }
    end
  end

  # Test suite for DELETE /orders/:id
  describe 'DELETE /orders/:id' do
    before { delete "/orders/#{orders[1].id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
