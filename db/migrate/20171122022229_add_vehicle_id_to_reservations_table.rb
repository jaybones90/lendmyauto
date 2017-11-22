class AddVehicleIdToReservationsTable < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :vehicle_id, :integer
  end
end
