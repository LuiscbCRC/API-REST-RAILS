# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DeliveryDate, type: :model do
  it { should have_many(:orders) }
end
