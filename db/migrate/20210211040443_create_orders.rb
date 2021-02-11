# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.float :amount
      t.references :user, null: false, foreign_key: true
      t.references :payment_status, null: false, foreign_key: true
      t.references :order_status, null: false, foreign_key: true
      t.belongs_to :delivery_date, optional: true
      t.belongs_to :payment_date, optional: true

      t.timestamps
    end
  end
end
