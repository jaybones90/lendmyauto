class RenameZipcodeColumnOnLocationsToStringType < ActiveRecord::Migration[5.1]
  def change
    change_column :locations, :zip_code, :string
  end
end
