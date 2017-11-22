class Vehicle < ApplicationRecord
  has_many :images
  has_many :features
  has_many :reservations

  accepts_nested_attributes_for :features, :images

  belongs_to :user

  validates :make, :model, :year, :milage, :transmission, :color, :seats, :category, :availability_start, :presence => true

  scope :popular_cars, -> {limit(3)}
end
