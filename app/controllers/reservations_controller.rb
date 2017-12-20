class ReservationsController < ApplicationController
  include DateRange
  before_action :save_desired_vehicle_and_redirect,
                :only => :create

  def new
    @vehicle = Vehicle.find(params[:vehicle_id])
    @features = @vehicle.features
    @reservation = @vehicle.reservations.new()
  end

  def create
    @vehicle = Vehicle.find(params[:vehicle_id])
    @reservation = create_new_reservation(@vehicle)
    if @reservation.save!
      session[:current_reservation_id] = @reservation.id
      redirect_to new_charge_path(:reservation_id => @reservation.id)
    else
      flash[:alert] = "Something went wrong, please try again"
      render :new
    end
  end

  private
  #
  def reservation_params
    params.require(:reservation).permit(:date_range)
  end

  def save_desired_vehicle_and_redirect
    if user_signed_in?
      :authenticate_user!
    else
      session[:desired_vehicle] = params[:vehicle_id]
      redirect_to new_user_registration_path
    end
  end

  def create_new_reservation(vehicle)
    vehicle.reservations.new(
      renter_account_id: current_user.account.id,
      lender_account_id: vehicle.owner_account_id,
      location_id: vehicle.current_location.id,
      start_date: parse_start_date(reservation_params[:date_range]),
      end_date: parse_end_date(reservation_params[:date_range])
    )
  end

end
