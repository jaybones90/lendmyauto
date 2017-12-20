class ReservationsController < ApplicationController
  before_action :save_desired_vehicle_and_redirect,
                :parse_date_range,
                :only => :create

  def new
    @vehicle = Vehicle.find(params[:vehicle_id])
    @features = @vehicle.features
    @reservation = @vehicle.reservations.new()
  end

  def create
    @vehicle = Vehicle.find(params[:vehicle_id])
    @reservation = @vehicle.reservations.new(
      renter_account_id: current_user.account.id,
      lender_account_id: @vehicle.owner_account_id,
      location_id: @vehicle.current_location.id,
      start_date: @start_date,
      end_date: @end_date
    )
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

  def parse_date_range
    split_dates = reservation_params[:date_range].split(' - ')
    @start_date = Date.strptime(split_dates[0], '%m/%d/%Y')
    @end_date = Date.strptime(split_dates[1], '%m/%d/%Y')
    return @start_date, @end_date
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
