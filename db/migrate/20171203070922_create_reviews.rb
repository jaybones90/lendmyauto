class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :rating
      t.integer :reviewer_account_id, index: true
      t.belongs_to :vehicle, index: true
      t.timestamps
    end
    add_foreign_key "reviews", "accounts", column: "reviewer_account_id"
    add_foreign_key "reviews", "vehicles"
  end
end
