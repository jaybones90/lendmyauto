class VehiclesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @vehicle = @user.vehicles.new()
    @image = @vehicle.images.new()
    @features = @vehicle.features.new()
  end

  def create
    @user = User.find(params[:user_id])
    @vehicle = @user.vehicles.new(vehicle_params)
    @vehicle.availability_start = availability_start_params
    @vehicle.availability_end = availability_end_params
    if @vehicle.save
      redirect_to new_vehicle_image_path(@vehicle)
    else
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
      redirect_to user_path(@vehicle.user)
    else
      render :edit
    end
  end

  def destroy
    @vehicle = Vehicle.find(params[:id])
    @user = @vehicle.user
    @vehicle.destroy
    redirect_to user_path(@user)
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:make, :model, :year, :milage, :transmission, :color, :seats, :category, features_attributes: [:all_wheel_drive, :smoking_allowed, :pets_allowed, :gps, :ski_rack, :bike_rack, :bluetooth, :sunroof, :audio_input, :snowtires_or_chains, :rear_camera, :navigation, :heated_seats])
  end

  def image_params
    params.require(:image).permit(:avatar)
  end

  def availability_start_params
    Date.civil(params[:start_date][:year].to_i, params[:start_date][:month].to_i, params[:start_date][:day].to_i)
  end

  def availability_end_params
    Date.civil(params[:end_date][:year].to_i, params[:end_date][:month].to_i, params[:end_date][:day].to_i)
  end

end
