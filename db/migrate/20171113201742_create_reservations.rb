class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :pickup_location_id
      t.integer :dropoff_location_id
      t.bigint :total_price
      t.integer :renter_id
      t.integer :lender_id
    end
  end
end
