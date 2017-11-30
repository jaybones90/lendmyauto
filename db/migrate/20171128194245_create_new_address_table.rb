class CreateNewAddressTable < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip_code
      t.integer :current_location_id
      t.integer :dropoff_location_id
      t.belongs_to :account, index: true
      t.belongs_to :vehicle, index: true
    end
  end
end
