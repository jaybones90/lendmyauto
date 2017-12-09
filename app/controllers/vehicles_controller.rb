class VehiclesController < ApplicationController
  before_action :validate_city_exists, only: :index

  def index
    @vehicles = Vehicle.get_available_vehicles(params)
  end

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
    params.require(:vehicle).permit(:make, :model, :year, :milage, :transmission, :color, :seats, :doors, :category, :daily_price, :availability_start, :availability_end, feature_ids:[], images_attributes: [:id, :avatar, :_delete], category_attributes: [:id, :name, :_delete])
  end

  def validate_city_exists
    city = params[:city] if params[:city]
    unless Location.exists?(['city ILIKE ?', city])
      flash[:alert] = "We Are Not Yet Active In #{city}"
      redirect_to root_path
    else
      return
    end
  end

end
