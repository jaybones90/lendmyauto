class DropReservations < ActiveRecord::Migration[5.1]
  def change
    drop_table :reservations
  end
end
