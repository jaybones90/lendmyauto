class AddDoorsColumnToVehicles < ActiveRecord::Migration[5.1]
  def change
    add_column :vehicles, :doors, :integer
  end
end
