class Account < ApplicationRecord
  belongs_to :user
  has_many :reservations, :foreign_key => "renter_account_id", inverse_of: :renter_account, dependent: :destroy

  has_many :loans, :foreign_key => "lender_account_id", inverse_of: :lender_account

  has_many :rented_vehicles, :through => :reservations, source: :vehicle, :foreign_key => "renter_account_id"

  has_many :loaned_vehicles, :through => :reservations, source: :vehicle, :foreign_key => "lender_account_id"

  has_many :owned_vehicles, :foreign_key => "owner_account_id", inverse_of: :owner_account

end
