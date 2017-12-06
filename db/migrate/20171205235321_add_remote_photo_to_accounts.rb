class AddRemotePhotoToAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :remote_image, :string
  end
end
