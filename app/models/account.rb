class Account < ApplicationRecord
  has_many :addresses, :as => :addressable, :dependent => :destroy
  belongs_to :user

  has_many :vehicles, dependent: :destroy
  has_many :rentals, :class_name => "Reservation", :foreign_key => "renter_account_id"
  has_many :loans, :class_name => "Reservation", :foreign_key => "lender_account_id"
end
