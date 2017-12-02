class MakeImagesPolymorphic < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :imageable_id, :integer
    add_column :images, :imageable_type, :string
    remove_column :images, :vehicle_id
    add_index :images, [:imageable_type, :imageable_id]
  end
end
