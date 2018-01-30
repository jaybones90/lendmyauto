class Account < ApplicationRecord

  attr_accessor :skip_birthdate_validation, :skip_phone_validation

  belongs_to :user, inverse_of: :account

  has_one :drivers_license, dependent: :destroy
  has_one :image, as: :imageable, dependent: :destroy

  has_many :reservations, :foreign_key => "renter_account_id", inverse_of: :renter_account,
            class_name: 'Reservation', dependent: :nullify
  has_many :loans, :foreign_key => "lender_account_id", inverse_of: :lender_account,
            class_name: 'Reservation', dependent: :nullify
  has_many :owned_vehicles, :foreign_key => "owner_account_id", class_name: "Vehicle",
            inverse_of: :owner_account, dependent: :destroy
  has_many :reviews, inverse_of: :reviewer_account

  accepts_nested_attributes_for :image

  validates_associated :drivers_license
  validates_associated :image
  validates_associated :reservations
  validates_associated :loans
  validates_associated :owned_vehicles

  validate :age_over_18, on: :update

  validates :user_birth_date, presence: true,
            on: :update, unless: :skip_birthdate_validation

  validates :user_phone_number, presence: true, :numericality => { only_integer: true },
            :length => { is: 10 }, on: :update, unless: :skip_phone_validation

  validates :user_first_name, :user_last_name, presence: true,
            :length => { in: 2..20 }, on: :update

  private

  def age_over_18
    if user_birth_date.present? && user_birth_date > 18.years.ago
       errors.add(:user_birth_date, 'You Must Be Over 18 Years Old To Use This Service')
    end
  end



end
