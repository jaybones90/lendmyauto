class DriversLicense < ApplicationRecord

  belongs_to :account, inverse_of: :drivers_license

  has_one :image, as: :imageable, dependent: :destroy
  validates_associated :image

  accepts_nested_attributes_for :image

end
