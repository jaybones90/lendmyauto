class ReservationsController < ApplicationController

  def new
    @user = current_user
    @vehicle_to_rent = Vehicle.find(params[:vehicle_id])
    @reservation = @user.rentals.new()
  end

  def create
  end

end
