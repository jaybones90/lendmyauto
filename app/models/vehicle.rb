class Vehicle < ApplicationRecord

  belongs_to :current_location, class_name: "Location", inverse_of: :vehicles
  belongs_to :category, inverse_of: :vehicles, optional: true
  belongs_to :owner_account, inverse_of: :owned_vehicles, class_name: "Account", optional: true, foreign_key: 'owner_account_id'

  has_and_belongs_to_many :features, dependent: :delete_all
  has_many :images, as: :imageable, dependent: :delete_all
  has_many :reviews, inverse_of: :vehicle, dependent: :destroy
  has_many :reservations, inverse_of: :vehicle, dependent: :nullify

  accepts_nested_attributes_for :images

  validates_associated :images
  validates_associated :reviews

  validates :make, :model, :year, :transmission, :color, :seats, :cylinders, :drive_type, :fuel_type,
            :highway_mpg, :milage, :daily_price, :availability_start, :availability_end,
            :presence => true

  private

  scope :with_availability, -> (date) {
    where( "availability_start <= ? and availability_end >= ?", date[:start], date[:end])
  }

  scope :exclude_reservations, -> (date) {
    left_outer_joins(:reservations)
    .merge(Reservation.exclude_existing_reservations(date))
  }

  scope :in_city, -> (city) {
    joins(:current_location)
    .merge(Location.in_city(city))
  }

  def self.get_available_vehicles(search_params)
    date = {start: search_params.date_start, end: search_params.date_end}
    Vehicle.includes(:features).includes(:images).in_city(search_params.city)
    .with_availability(date)
    .exclude_reservations(date)
  end


end
