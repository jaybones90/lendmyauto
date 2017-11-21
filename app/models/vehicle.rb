class Vehicle < ApplicationRecord
  belongs_to :user
  validates :make, :model, :year, :milage, :transmission, :color, :seats, :category, :availability_start, :presence => true
end
