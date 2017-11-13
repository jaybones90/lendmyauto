class Vehicle < ApplicationRecord
  belongs_to :user
  validates :make, :model, :year, :milage, :transmission, :color, :seats, :category, :all_wheel_drive,
            :pets_allowed, :smoking_allowed, :daily_price, :availability_start, :availability_end, :presence => true
end
