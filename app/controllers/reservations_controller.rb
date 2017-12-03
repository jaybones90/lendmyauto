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
    @reservation.renter_account_id = current_user.account.id
    @reservation.lender_account_id = @vehicle.owner_account_id
    @reservation.location_id = @vehicle.current_location.id
    if @reservation.save!
      redirect_to account_path(current_user.account)
    else
      flash[:alert] = "Something went wrong, please try again"
      render :new
    end
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
