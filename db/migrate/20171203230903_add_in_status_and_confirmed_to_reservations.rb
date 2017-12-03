class AddInStatusAndConfirmedToReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :status, :string
    add_column :reservations, :is_confirmed, :boolean, default: false
  end
end
