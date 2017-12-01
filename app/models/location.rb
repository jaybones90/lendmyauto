class Location < ApplicationRecord

  has_many :vehicles, :foreign_key => "current_location_id", inverse_of: :current_location, dependent: :nullify

  has_many :reservations, inverse_of: :location, dependent: :nullify

end
