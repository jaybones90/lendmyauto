class AddPickupAndDropoffLocationIdsToVehicles < ActiveRecord::Migration[5.1]
  def change
    add_column :vehicles, :pickup_location_id, :integer
    add_column :vehicles, :dropoff_location_id, :integer
  end
end
