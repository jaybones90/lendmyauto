class CreateDriversLicenses < ActiveRecord::Migration[5.1]
  def change
    create_table :drivers_licenses do |t|
      t.string :number
      t.date :expiration_date
      t.date :issue_date
      t.timestamps
    end
  end
end
