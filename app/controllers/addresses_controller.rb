class AddressesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @address = @user.addresses.new()
  end

  def create
    @user = User.find(params[:user_id])
    @address = @user.addresses.new(address_params)
    if @address.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private

  def address_params
    params.require(:address).permit(:street, :city, :state, :zip_code)
  end

end
