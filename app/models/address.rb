class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true, optional: true
  belongs_to :account, optional: true
  has_one :pickup_location, :class_name => "Reservation", :foreign_key => 'pickup_location_id'
  has_one :dropoff_location, :class_name => "Reservation", :foreign_key => 'dropoff_location_id'


end
