class AddAddressableScopeColumnToAddresses < ActiveRecord::Migration[5.1]
  def change
    add_column :addresses, :addressable_scope, :string, index: true
    remove_column :vehicles, :pickup_location_id
    remove_column :vehicles, :dropoff_location_id
  end


end
