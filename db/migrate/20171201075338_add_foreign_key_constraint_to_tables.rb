class AddForeignKeyConstraintToTables < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :features_vehicles, :vehicles
    add_foreign_key :features_vehicles, :features
    add_foreign_key :reservations, :accounts, column: :renter_account_id
    add_foreign_key :reservations, :accounts, column: :lender_account_id
    add_foreign_key :reservations, :vehicles
    add_foreign_key :vehicles, :locations, column: :current_location_id
    add_foreign_key :vehicles, :locations, column: :owner_account_id
    rename_column :vehicles, :vehicle_category_id, :category_id
    add_foreign_key :vehicles, :categories

  end
end
