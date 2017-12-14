class DriversLicense < ApplicationRecord

  belongs_to :account, inverse_of: :drivers_license
  has_one :image, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :image

  validates_associated :image
  validates :number, presence: true, :length => { maximum: 15 }, uniqueness: true
  validates :expiration_date, presence: true
  validates :issue_date, presence: true

end
