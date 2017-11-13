class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip_code
      t.belongs_to :user, index: true
      t.belongs_to :vehicle, index: true
    end
  end
end
