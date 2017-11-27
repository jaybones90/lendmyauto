class ReservationsController < ApplicationController


  def new
    @vehicle = Vehicle.find(params[:vehicle_id])
    @features = @vehicle.features
    @reservation = @vehicle.reservations.new()
  end

  def create
  end

end
