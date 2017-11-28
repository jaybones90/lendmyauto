class AddCurrentLocationAndDropoffLocationToVehiclesTable < ActiveRecord::Migration[5.1]
  def change
    add_column :addresses, :current_location_id, :integer
    add_column :addresses, :dropoff_location_id, :integer
  end
end
