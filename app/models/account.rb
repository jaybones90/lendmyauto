class Account < ApplicationRecord

  belongs_to :user, inverse_of: :account

  has_one :drivers_license, dependent: :destroy

  has_one :image, as: :imageable, dependent: :destroy

  has_many :reservations, :foreign_key => "renter_account_id", inverse_of: :renter_account, dependent: :nullify

  has_many :loans, :foreign_key => "lender_account_id", inverse_of: :lender_account, dependent: :nullify

  has_many :rented_vehicles, :through => :reservations, source: :vehicle, :foreign_key => "renter_account_id", dependent: :nullify

  has_many :loaned_vehicles, :through => :reservations, source: :vehicle, :foreign_key => "lender_account_id", dependent: :nullify

  has_many :owned_vehicles, :foreign_key => "owner_account_id", inverse_of: :owner_account, dependent: :destroy

end
