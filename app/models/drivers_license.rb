class DriversLicense < ApplicationRecord

  belongs_to :account, inverse_of: :drivers_license

  has_one :image, as: :imageable, dependent: :destroy

end
