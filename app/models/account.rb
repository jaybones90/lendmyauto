class Account < ApplicationRecord

  belongs_to :user, inverse_of: :account

  has_one :drivers_license, dependent: :destroy

  has_one :image, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :image


  has_many :reservations, :foreign_key => "renter_account_id", inverse_of: :renter_account, dependent: :nullify

  has_many :loans, :foreign_key => "lender_account_id", inverse_of: :lender_account, dependent: :nullify

  has_many :owned_vehicles, :foreign_key => "owner_account_id", class_name: "Vehicle", inverse_of: :owner_account, dependent:
 :destroy

  has_many :reviews, inverse_of: :reviewer_account, dependent: :nullify

  validates :user_first_name, :user_last_name, :user_birth_date, :user_phone_number, presence: true, on: :edit

end
