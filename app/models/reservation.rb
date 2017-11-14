class Reservation < ApplicationRecord
  belongs_to :renter, :class_name => "User", :foreign_key => 'renter_id'
  belongs_to :lender, :class_name => "User", :foreign_key => 'lender_id'
end
