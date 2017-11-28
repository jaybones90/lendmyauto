class DropAddressesTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :addresses
  end
end
