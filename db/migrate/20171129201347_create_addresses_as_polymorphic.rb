class CreateAddressesAsPolymorphic < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.integer :state
      t.integer :zip_code
      t.references :addressable, polymorphic: true

      t.timestamps
    end
  end
end
