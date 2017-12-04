class Location < ApplicationRecord

  has_many :vehicles, :foreign_key => "current_location_id", inverse_of: :current_location, dependent: :nullify
  validates_associated :vehicles

  has_many :reservations, inverse_of: :location, dependent: :nullify

  validates :street_address, :city, :state, :zip_code, :country, :presence => true

  def country_name
    country_name = ISO3166::Country[country]
    country_name.translations[I18n.locale.to_s] || country_name.name
  end

end
