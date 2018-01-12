class AddStylesToVehicles < ActiveRecord::Migration[5.1]
  def change
    add_column :vehicles, :style, :string
  end
end
