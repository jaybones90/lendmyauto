class RecreateVehiclesTableWithAccountId < ActiveRecord::Migration[5.1]
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
      t.integer :daily_price
      t.belongs_to :account, index: true
      t.datetime :availability_start
      t.datetime :availability_end
    end
  end
end
