class RecreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.bigint :total_price
      t.bigint :renter_account_id, index: true
      t.bigint :lender_account_id, index: true
      t.belongs_to :vehicle, index: true
    end
  end
end
