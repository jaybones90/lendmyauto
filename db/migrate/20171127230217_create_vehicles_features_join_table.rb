class CreateVehiclesFeaturesJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_table :features_vehicles, id: false do |t|
      t.belongs_to :vehicle, index: true
      t.belongs_to :feature, index: true
    end
  end
end
