# frozen_string_literal: true

class PaymentStatusesController < ApplicationController
  def index
    @payment_statuses = PaymentStatus.all
    json_response(@payment_statuses)
  end
end
