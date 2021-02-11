# frozen_string_literal: true

Rails.application.routes.draw do
  resources :order_statuses
  resources :payment_statuses
  resources :users

  resources :orders
  match 'orders/(:date)' => 'orders#index',
        :constraints => { date: /\d{4}-\d{2}-\d{2}/ },
        :as => 'orders_date', :via => [:get]
end
