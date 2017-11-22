class Reservation < ApplicationRecord
  belongs_to :vehicle
  belongs_to :renter, :class_name => "User", :foreign_key => 'renter_id'
  belongs_to :lender, :class_name => "User", :foreign_key => 'lender_id'
  belongs_to :pickup_location, :class_name => "Address", :foreign_key => "pickup_location_id"
  belongs_to :dropoff_location, :class_name => "Address", :foreign_key => "dropoff_location_id"
end
