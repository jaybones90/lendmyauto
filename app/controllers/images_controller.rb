class ImagesController < ApplicationController

  def new
    @vehicle = Vehicle.find(params[:vehicle_id])
    @image = @vehicle.images.new()
  end

  def create
    @vehicle = Vehicle.find(params[:vehicle_id])
    @account = current_user.account
    @image = @vehicle.images.new(image_params)
    if @image.save
      redirect_to account_path(@account)
    else
      render :new
    end
  end

  private

  def image_params
    params.require(:image).permit(:avatar)
  end

end
