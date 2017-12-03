class AddLocationIdToReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :location_id, :integer
    add_foreign_key :reservations, :locations
    add_index :reservations, [:location_id]
  end
end
