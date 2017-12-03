class CreateReservationInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :reservation_invoices do |t|
      t.belongs_to :reservation, index: true
      t.decimal :service_tax
      t.decimal :vat
      t.decimal :total_amount
      t.decimal :discount_amount
      t.decimal :net_amount
    end
    add_foreign_key :reservation_invoices, :reservations
  end
end
