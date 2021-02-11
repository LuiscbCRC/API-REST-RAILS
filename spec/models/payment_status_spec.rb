# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PaymentStatus, type: :model do
  it { should have_many(:orders) }
end
