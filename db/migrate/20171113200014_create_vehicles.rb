class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.integer :milage
      t.string :transmission
      t.string :color
      t.integer :seats
      t.string :category
      t.boolean :all_wheel_drive
      t.boolean :pets_allowed
      t.boolean :smoking_allowed
      t.integer :daily_price
      t.belongs_to :user, index: true
      t.datetime :availability_start
      t.datetime :availability_end
    end
  end
end
