class RemoveFeatureAttributesFromVehiclesTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :vehicles, :all_wheel_drive
    remove_column :vehicles, :pets_allowed
    remove_column :vehicles, :smoking_allowed
  end
end
