class Account < ApplicationRecord
  belongs_to :user
  has_many :reservations, :foreign_key => "renter_account_id", inverse_of: :account
  has_many :reserved_vehicles, :through => :reservations, source: :vehicles, :foreign_key => "renter_account_id"
  has_many :loaned_vehicles, :through => :reservations, source: :vehicles, :foreign_key => "lender_account_id"
  has_many :vehicles, :foreign_key => "owner_account_id", inverse_of: :account
end
