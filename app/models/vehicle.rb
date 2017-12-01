class Vehicle < ApplicationRecord

  belongs_to :current_location, class_name: "Location", inverse_of: :vehicle

  belongs_to :vehicle_category
  belongs_to :account, inverse_of: :vehicles, class_name: "Account", optional: true, foreign_key: 'owner_account_id'

  has_and_belongs_to_many :features, dependent: :destroy
  has_many :images, dependent: :destroy

  has_many :reservations, inverse_of: :vehicle
  has_many :rental_accounts, :through => :reservations, source: :account


  accepts_nested_attributes_for :images

  validates :make, :model, :year, :milage, :transmission, :color, :seats, :doors, :daily_price,  :presence => true


end
