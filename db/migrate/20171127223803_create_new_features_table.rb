class CreateNewFeaturesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :features do |t|
      t.string :name
      t.belongs_to :vehicle, index: true
      t.timestamps
    end
  end
end
