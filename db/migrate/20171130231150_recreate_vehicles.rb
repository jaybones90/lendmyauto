class RecreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.integer :milage
      t.string :transmission
      t.string :color
      t.integer :seats
      t.integer :doors
      t.integer :daily_price
      t.bigint :current_location_id, index: true
      t.belongs_to :vehicle_category, index: true
      t.bigint :owner_account_id, index: true
    end
  end
end
