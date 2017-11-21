class ImagesController < ApplicationController

  def new
    @vehicle = Vehicle.find(params[:vehicle_id])
    @image = @vehicle.images.new()
  end

  def create
    @vehicle = Vehicle.find(params[:vehicle_id])
    @user = @vehicle.user
    @image = @vehicle.images.new(image_params)
    if @image.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private

  def image_params
    params.require(:image).permit(:avatar)
  end

end
