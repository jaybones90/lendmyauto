class LocationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @location = Location.new().to_json
  end

  def create
    @location = Location.new(location_params)
    if @location.save!
      render json: { location: @location, current_user: current_user }
      # redirect_to new_location_vehicle_path(@location)
    else
      render json: { errors: @location.errors }, status: :unauthorized
    end
  end

  private
  def location_params
    params.require(:location).permit(:street_address, :city, :state, :zip_code, :country)
  end
end
