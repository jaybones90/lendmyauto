class Vehicle < ApplicationRecord
  has_and_belongs_to_many :features, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :reservations

  has_one :pickup_address, -> { where(addressable_scope: :pickup_address) }, as: :addressable,  class_name: "Address", dependent: :destroy
  accepts_nested_attributes_for :pickup_address, allow_destroy: true

  has_one :dropoff_address, -> { where(addressable_scope: :dropoff_address) }, as: :addressable,  class_name: "Address", dependent: :destroy
  accepts_nested_attributes_for :dropoff_address, allow_destroy: true

  accepts_nested_attributes_for :images

  belongs_to :account

  validates :make, :model, :year, :milage, :transmission, :color, :doors, :seats, :category, :availability_start, :presence => true

  scope :popular_cars, -> {limit(3)}
end
