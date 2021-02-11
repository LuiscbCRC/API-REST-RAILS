# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PaymentDate, type: :model do
  it { should have_many(:orders) }
end
