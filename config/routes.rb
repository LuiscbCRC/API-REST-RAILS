# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  root 'mains#index'
  resources :order_statuses
  resources :payment_statuses
  resources :users
  resources :orders
  match 'orders/(:date)' => 'orders#index',
        :constraints => { date: /\d{4}-\d{2}-\d{2}/ },
        :as => 'orders_date', :via => [:get]
end
