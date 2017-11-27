class ReservationsController < ApplicationController


  def new
    @vehicle = Vehicle.find(params[:vehicle_id])
    @features = Feature.where(vehicle_id: @vehicle.id).as_json

    @reservation = @vehicle.reservations.new()
  end

  def create
  end

end
