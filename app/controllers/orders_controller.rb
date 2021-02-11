# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_order, only: %i[show update destroy]

  # GET /orders
  def index
    if params[:date].nil?
      @orders = Order.all
      json_response(@orders)

    else
      @date = params[:date]
      @idDate = DeliveryDate.find_by(date: @date).id
      @orders = Order.find_by(delivery_date_id: @idDate)
      json_response(@orders)
    end
  end

  # POST /orders
  def create
    @order = Order.create!(order_params)
    json_response(@order, :created)
  end

  # GET /orders/:id
  def show
    json_response(@order)
  end

  # PUT /orders/:id
  def update
    if params[:payment_status_id].to_i == PaymentStatus.find_by(status: 'Pagada').id
      @date = PaymentDate.create(date: Time.now)
      @order.payment_date_id = @date.id
    end

    if params[:order_status_id].to_i == OrderStatus.find_by(status: 'Entregada').id
      @date = DeliveryDate.create(date: Time.now)
      @order.delivery_date_id = @date.id
    end
    @order.update(order_params)
    head :no_content
  end

  # DELETE /orders/:id
  def destroy
    @order.destroy
    head :no_content
  end

  private

  def order_params
    params.permit(:amount, :user_id, :payment_status_id, :order_status_id, :delivery_date_id, :payment_date_id)
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
