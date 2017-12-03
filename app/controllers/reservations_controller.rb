class ReservationsController < ApplicationController
  before_action :save_desired_vehicle_and_redirect, :only => :create


  def new
    @vehicle = Vehicle.find(params[:vehicle_id])
    @features = @vehicle.features
    @reservation = @vehicle.reservations.new()
  end

  def create
    @vehicle = Vehicle.find(params[:vehicle_id])
    @reservation = @vehicle.reservations.new(reservation_params)


  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end

  def save_desired_vehicle_and_redirect
    if user_signed_in?
      :authenticate_user!
    else
      session[:desired_vehicle] = params[:vehicle_id]
      redirect_to new_user_registration_path
    end
  end

end
