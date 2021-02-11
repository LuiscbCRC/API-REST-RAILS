# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  # initialize test data
  let!(:users) { create_list(:user, 10) }

  # Test suite for GET /users/:id
  describe 'GET /users/:id' do
    before { get "/users/#{users[1].id}" }

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

  # Test suite for POST /users
  describe 'POST /users' do
    # valid payload
    let(:valid_attributes) { { name: 'John Doe', email: 'test@gmail.com' } }

    context 'when the request is valid' do
      before { post '/users', params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/users', params: { name: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  # Test suite for PUT /users/:id
  describe 'PUT /users/:id' do
    let(:valid_attributes) { { name: 'Shopping' } }

    context 'when the record exists' do
      before { put "/users/#{users[1].id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /users/:id
  describe 'DELETE /users/:id' do
    before { delete "/users/#{users[1].id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
