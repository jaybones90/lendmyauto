class RenameVehiclesCategoryTableToCategory < ActiveRecord::Migration[5.1]
  def change
    rename_table :vehicle_categories, :categories
  end
end
