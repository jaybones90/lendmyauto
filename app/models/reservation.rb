class Reservation < ApplicationRecord
  belongs_to :vehicle
  belongs_to :renter_account, :class_name => "Account"
  belongs_to :lender_account, :class_name => "Account"
  belongs_to :pickup_location, :class_name => "Address", :foreign_key => "pickup_location_id"
  belongs_to :dropoff_location, :class_name => "Address", :foreign_key => "dropoff_location_id"
end
