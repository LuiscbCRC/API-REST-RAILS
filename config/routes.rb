# frozen_string_literal: true

Rails.application.routes.draw do
  resources :orders
  resources :payment_dates
  resources :delivery_dates
  resources :order_statuses
  resources :payment_statuses
  resources :users
end
