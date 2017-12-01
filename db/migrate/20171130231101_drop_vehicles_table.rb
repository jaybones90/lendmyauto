class DropVehiclesTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :vehicles
  end
end
