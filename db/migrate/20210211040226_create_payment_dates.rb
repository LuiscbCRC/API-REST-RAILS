class CreatePaymentDates < ActiveRecord::Migration[6.1]
  def change
    create_table :payment_dates do |t|
      t.date :date

      t.timestamps
    end
  end
end
