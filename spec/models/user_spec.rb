# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:orders) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:email) }
  it { should_not allow_value('test').for(:email) }
  it { should_not allow_value('test@test').for(:email) }
  it { should allow_value('test@test.com').for(:email) }
end
