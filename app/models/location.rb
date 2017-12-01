class Location < ApplicationRecord
  has_many :vehicles, :foreign_key => "current_location_id", inverse_of: :location
  has_many :reservations, inverse_of: :location


end
