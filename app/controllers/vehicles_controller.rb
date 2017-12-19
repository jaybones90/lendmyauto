class VehiclesController < ApplicationController
  before_action :authenticate_user!


  def new
    @location = Location.find(params[:location_id])
    @vehicle = @location.vehicles.new()
    @features = @vehicle.features.new()
  end

  def create
    @location = Location.find(params[:location_id])
    @vehicle = @location.vehicles.new(vehicle_params)
    @vehicle.owner_account_id = current_user.account.id
    if @vehicle.save
      redirect_to account_path(current_user.account)
    else
      flash[:alert] = "Something went wrong, please try again"
      render :new
    end
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  def update
    @vehicle = Vehicle.find(params[:id])
    if @vehicle.update(vehicle_params)
      redirect_to account_path(current_user.account)
    else
      render :edit
    end
  end

  def destroy
    @vehicle = Vehicle.find(params[:id])
    @vehicle.destroy
    redirect_to account_path(current_user.account)
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:make, :model, :year, :milage, :transmission, :color, :seats, :doors, :category_id, :daily_price, :availability_start, :availability_end, feature_ids:[], images_attributes: [:id, :avatar, :_delete])
  end


end
