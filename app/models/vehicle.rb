class Vehicle < ApplicationRecord

  belongs_to :current_location, class_name: "Location", inverse_of: :vehicles
  belongs_to :category, inverse_of: :vehicles
  belongs_to :owner_account, inverse_of: :owned_vehicles, class_name: "Account", optional: true, foreign_key: 'owner_account_id'

  has_and_belongs_to_many :features, dependent: :delete_all
  has_many :images, as: :imageable, dependent: :delete_all
  has_many :reviews, inverse_of: :vehicle, dependent: :destroy
  has_many :reservations, inverse_of: :vehicle, dependent: :nullify

  accepts_nested_attributes_for :category
  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :images

  validates_associated :images
  validates_associated :reviews

  validates :make, :model, :year, :milage, :transmission, :color, :seats, :doors, :daily_price, :availability_start, :availability_end, :presence => true

  # scope :get_vehicles, lambda {|zip| joins(:current_location).where(locations: {zip_code: zip})}


end
