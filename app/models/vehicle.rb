class Vehicle < ApplicationRecord

  belongs_to :current_location, class_name: "Location", inverse_of: :vehicles

  belongs_to :category, inverse_of: :vehicles
  accepts_nested_attributes_for :category

  belongs_to :owner_account, inverse_of: :owned_vehicles, class_name: "Account", optional: true, foreign_key: 'owner_account_id'

  has_and_belongs_to_many :features, dependent: :delete_all

  has_many :images, as: :imageable, dependent: :delete_all
  accepts_nested_attributes_for :images

  has_many :reservations, inverse_of: :vehicle, dependent: :nullify

  has_many :rental_accounts, :through => :reservations, source: :account, foreign_key: 'renter_account_id', dependent: :nullify

  accepts_nested_attributes_for :images

  validates :make, :model, :year, :milage, :transmission, :color, :seats, :doors,  :presence => true

  # scope :get_vehicles, lambda {|zip| joins(:current_location).where(locations: {zip_code: zip})}


end
