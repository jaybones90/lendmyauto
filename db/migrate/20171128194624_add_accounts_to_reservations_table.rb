class AddAccountsToReservationsTable < ActiveRecord::Migration[5.1]
  def change
    rename_column :reservations, :renter_id, :renter_account_id
    rename_column :reservations, :lender_id, :lender_account_id
  end
end
