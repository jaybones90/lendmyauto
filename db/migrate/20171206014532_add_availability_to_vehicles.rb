class AddAvailabilityToVehicles < ActiveRecord::Migration[5.1]
  def change
    add_column :vehicles, :availability_start, :date
    add_column :vehicles, :availability_end, :date
  end
end
