class LocationsController < ApplicationController

  def new
    @location = Location.new()
  end

  private
  def location_params
    params.require(:location).permit(:street_address, :city, :state, :zip_code, :country)
  end
end
