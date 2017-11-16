class VehiclesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @vehicle = Vehicle.new()
  end

  def create
  end
end
