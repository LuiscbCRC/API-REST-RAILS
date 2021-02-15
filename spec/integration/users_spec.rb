# frozen_string_literal: true

require 'swagger_helper'

# Read all
describe 'Users' do
  path '/users' do
    get 'Get all users' do
      tags 'Users'
      produces 'application/json'

      response '200', 'Users found' do
        before { create_list(:user, 2) }
        run_test!
      end
    end
  end

  # Search by id
  path '/users/{id}' do
    get 'Search an user by id' do
      tags 'Users'
      description 'Query to search a single user by passing the id of the order as parameter'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'User found' do
        let(:id) { User.create(name: 'John Doe', email: 'test@gmail.com').id }
        run_test!
      end

      response '404', 'User not found' do
        let(:id) { -1 }

        run_test!
      end
    end
  end

  # Create
  path '/users' do
    post 'Create an user' do
      tags 'Users'
      description 'Query to create a user. Name and email must be given. Model verifies integrity of email structure.'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string }
        },
        required: %w[name email]
      }

      produces 'application/json'

      response '201', 'User created' do
        let(:params) { { user: attributes_for(:user) } }
        let(:user) { build(:user, email: Faker::Internet.email) }
        run_test!
      end

      response '422', 'User creation failed for email missing' do
        let(:params) { { user: attributes_for(:user) } }
        let(:user) { build(:user, email: nil) }
        run_test!
      end
    end
  end

  # Update
  path '/users/{id}' do
    put 'Update an user based on an id' do
      tags 'Users'
      description 'Updates an user based on an id. Any field can be modified.'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string }
        },
        required: %w[name email]
      }
      produces 'application/json'

      response '204', 'User created' do
        let(:params) { { user: attributes_for(:user) } }
        let(:user) { create(:user) }
        let(:id) { user.id }

        run_test!
      end

      response '404', 'Cant find any user' do
        let(:params) { { user: attributes_for(:user) } }
        let(:user) { create(:user) }
        let(:id) { -1 }
        run_test!
      end
    end
  end

  # Delete
  path '/users/{id}' do
    delete 'Delete a user by id' do
      tags 'Users'
      description 'Query to destroy a single user by passing the id of the user as parameter'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string
      produces 'application/json'

      response '204', 'Destroy the user' do
        let(:user) { create(:user) }
        let(:id) { user.id }

        run_test!
      end
      response '204', 'Destroy the user' do
        let(:user) { create(:user) }
        let(:id) { user.id }
        run_test!
      end
    end
  end
end
