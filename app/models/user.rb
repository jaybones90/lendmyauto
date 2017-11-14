class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  validates :first_name, :last_name, :email, :age, :phone_number, :presence => true

  has_many :addresses
  has_many :vehicles
  has_many :rentals, :class_name => "Reservation", :foreign_key => "renter_id"
  has_many :loans, :class_name => "Reservation", :foreign_key => "lender_id"
end
