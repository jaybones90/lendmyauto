class CreateFeatures < ActiveRecord::Migration[5.1]
  def change
    create_table :features do |t|
      t.boolean :pets_allowed
      t.boolean :smoking_allowed
      t.boolean :all_wheel_drive
      t.boolean :gps
      t.boolean :ski_rack
      t.boolean :bike_rack
      t.boolean :bluetooth
      t.boolean :audio_input
      t.boolean :sunroof
      t.boolean :snowtires_or_chains
      t.boolean :rear_camera
      t.boolean :navigation
      t.boolean :heated_seats
      t.belongs_to :vehicle, index: true
      t.timestamps
    end
  end
end
