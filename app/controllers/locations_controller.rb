class LocationsController < ApplicationController

  def new
    @location = Location.new()
  end

  def create
    @location = Location.new(location_params)
    if @location.save!
      redirect_to new_location_vehicle_path(@location)
    else
      render :new
      flash[:alert] = "Something went wrong, please try again"
    end
  end

  private
  def location_params
    params.require(:location).permit(:street_address, :city, :state, :zip_code, :country)
  end
end
