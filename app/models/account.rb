class Account < ApplicationRecord

  belongs_to :user, inverse_of: :account

  has_one :drivers_license, dependent: :destroy
  has_one :image, as: :imageable, dependent: :destroy

  has_many :reservations, :foreign_key => "renter_account_id", inverse_of: :renter_account, class_name: 'Reservation', dependent: :nullify
  has_many :loans, :foreign_key => "lender_account_id", inverse_of: :lender_account, class_name: 'Reservation', dependent: :nullify
  has_many :owned_vehicles, :foreign_key => "owner_account_id", class_name: "Vehicle", inverse_of: :owner_account, dependent: :destroy


  accepts_nested_attributes_for :image

  validates_associated :drivers_license
  validates_associated :image
  validates_associated :reservations
  validates_associated :loans
  validates_associated :owned_vehicles


  validates :user_first_name, :user_last_name, :user_birth_date, :user_phone_number, presence: true, on: :update
  validate :validate_age_over_18

  private

  def validate_age_over_18
    if user_birth_date.present? && user_birth_date < 18.years.ago.to_i
       errors.add(:user_birth_date, 'You Must Be Over 18 Years Old To Use This Service')
    end
  end



end
