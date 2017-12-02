class DriversLicense < ApplicationRecord

  belongs_to :account, inverse_of: :drivers_license

  has_one :image, as: :imageable, dependent: :destroy

  accepts_nested_attributes_for :image

end
