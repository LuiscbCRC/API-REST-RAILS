# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should belong_to(:order_status) }
  it { should belong_to(:payment_status) }
  it { should belong_to(:payment_date) }
  it { should belong_to(:delivery_date) }
  it { should belong_to(:user) }
end
