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
  }

  scope :without_reservations, -> (start_date, end_date) {
    joins(:reservations)
    .merge(Reservation.exclude_existing_reservations(start_date,end_date))
  }

  scope :in_city, -> (city) {
    joins(:current_location)
    .merge(Location.in_city(city))
  }

  def self.get_available_vehicles(search_params)
    starting_date = Date.civil(search_params["start_date(1i)"].to_i, search_params["start_date(2i)"].to_i, search_params["start_date(3i)"].to_i)
    ending_date = Date.civil(search_params["end_date(1i)"].to_i, search_params["end_date(2i)"].to_i, search_params["end_date(3i)"].to_i)
    if search_params[:city].nil?
      Vehicle.all
    else
      Vehicle.in_city(search_params[:city])
      .with_availability(starting_date, ending_date)
      .without_reservations(starting_date, ending_date)
    end
  end


end
