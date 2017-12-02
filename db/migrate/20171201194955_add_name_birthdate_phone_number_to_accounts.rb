class AddNameBirthdatePhoneNumberToAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :user_first_name, :string
    add_column :accounts, :user_last_name, :string
    add_column :accounts, :user_birth_date, :date
    add_column :accounts, :user_phone_number, :string
  end
end
