class CreateDriversLicenses < ActiveRecord::Migration[5.1]
  def change
    create_table :drivers_licenses do |t|
      t.string :number
      t.date :expiration_date
      t.date :issue_date
      t.belongs_to :account, index: true
      t.timestamps
    end
    add_foreign_key :drivers_licenses, :accounts
  end
end
