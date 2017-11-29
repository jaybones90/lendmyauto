class Vehicle < ApplicationRecord
  has_and_belongs_to_many :features, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :reservations

  has_many :current_location, :class_name => "Address", :foreign_key => 'current_location_id'
  has_many :dropoff_location, :class_name => "Address", :foreign_key => 'dropoff_location_id'

  accepts_nested_attributes_for :images

  belongs_to :account

  validates :make, :model, :year, :milage, :transmission, :color, :doors, :seats, :category, :availability_start, :presence => true

  scope :popular_cars, -> {limit(3)}
end
