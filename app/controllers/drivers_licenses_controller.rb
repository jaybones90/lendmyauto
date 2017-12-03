class DriversLicensesController < ApplicationController

  before_action :get_desired_vehicle, only: :create

  def new
    @account = Account.find(params[:account_id])
    @license = @account.build_drivers_license()
  end

  def create
    @account = Account.find(params[:account_id])
    @license = @account.build_drivers_license(drivers_license_params)
    if @license.save!
      if @vehicle
        redirect_to new_vehicle_reservation_path(@vehicle)
      else
        redirect_to account_path(@account)
      end
    else
      render :new
    end
  end

  private

  def drivers_license_params
    params.require(:drivers_license).permit(:number, :expiration_date, :issue_date, image_attributes: [:id, :avatar, :_delete])
  end

  def get_desired_vehicle
    if session[:desired_vehicle]
      @vehicle = Vehicle.find(session[:desired_vehicle])
      session[:desired_vehicle] = nil
    end
  end

end
