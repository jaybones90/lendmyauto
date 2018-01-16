class VehiclesController < ApplicationController
  before_action :authenticate_user!


  def new
    @location = Location.find(params[:location_id])
    @vehicle = @location.vehicles.new().to_json
    @features = Feature.all.to_json
  end

  def create
    @location = Location.find(params[:location_id])
    @vehicle = @location.vehicles.new(vehicle_params)
    @vehicle.owner_account_id = current_user.account.id
    if @vehicle.save
      render json: { vehicle: @vehicle, current_user: current_user }
    else
      render json: { errors: @vehicle.errors }, status: :unauthorized
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
    params.require(:vehicle).permit(:make, :model, :year, :milage, :transmission, :color, :seats, :doors, :cylinders,
                                    :alternative_fuel_type, :drive_type, :fuel_type, :highway_mpg,
                                    :style, :category_id, :daily_price, :availability_start, :availability_end, feature_ids:[], images_attributes: [:id, :avatar, :_delete])
  end


end
