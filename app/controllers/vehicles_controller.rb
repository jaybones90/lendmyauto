class VehiclesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @vehicle = @user.vehicles.new()
  end

  def create
    @user = User.find(params[:user_id])
    @vehicle = @user.vehicles.new(vehicle_params)
    @vehicle.availability_start = availability_start_params
    @vehicle.availability_end = availability_end_params
    if @vehicle.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:make, :model, :year, :milage, :transmission, :color, :seats, :category)
  end

  def availability_start_params
    Date.civil(params[:start_date][:year].to_i, params[:start_date][:month].to_i, params[:start_date][:day].to_i)
  end

  def availability_end_params
    Date.civil(params[:end_date][:year].to_i, params[:end_date][:month].to_i, params[:end_date][:day].to_i)
  end

end
