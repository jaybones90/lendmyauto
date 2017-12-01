class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :street_address, limit: 255
      t.string :city, limit: 255
      t.string :state, limit: 255
      t.integer :zip_code
      t.string :country, limit: 255
    end
  end
end
