class AddExtraAttributesToVehicles < ActiveRecord::Migration[5.1]
  def change
    add_column :vehicles, :cylinders, :string
    add_column :vehicles, :alternative_fuel_type, :string
    add_column :vehicles, :drive_type, :string
    add_column :vehicles, :fuel_type, :string
    add_column :vehicles, :highway_mpg, :integer
  end
end
