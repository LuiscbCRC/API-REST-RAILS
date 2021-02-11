# frozen_string_literal: true

class OrderStatusesController < ApplicationController
  def index
    @order_statuses = OrderStatus.all
    json_response(@order_statuses)
  end
end
