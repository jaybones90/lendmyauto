class Vehicle < ApplicationRecord

  belongs_to :current_location, class_name: "Location", inverse_of: :vehicles
  belongs_to :category, inverse_of: :vehicles, optional: true
  belongs_to :owner_account, inverse_of: :owned_vehicles, class_name: "Account", optional: true, foreign_key: 'owner_account_id'

  has_and_belongs_to_many :features, dependent: :delete_all
  has_many :images, as: :imageable, dependent: :delete_all
  has_many :reviews, inverse_of: :vehicle, dependent: :destroy
  has_many :reservations, inverse_of: :vehicle, dependent: :nullify

  accepts_nested_attributes_for :category
  accepts_nested_attributes_for :images

  validates_associated :images
  validates_associated :reviews

  validates :make, :model, :year, :milage, :transmission, :color, :seats, :doors, :daily_price, :availability_start, :availability_end, :presence => true

  private

  scope :with_availability, -> (start_date, end_date) {
    where( "availability_start <= ? and availability_end >= ?", start_date, end_date )
    .joins(:reservations)
    .merge(Reservation.with_availability(start_date, end_date))
  }

  scope :within_city, -> (city) {
    joins(:current_location)
    .merge(Location.in_city(city))
  }


end
