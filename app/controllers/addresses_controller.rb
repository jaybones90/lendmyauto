class AddressesController < ApplicationController

  def new
    @address = Address.new()
  end

  def create
    @account = current_user.account
    @address = @account.addresses.new(address_params)
    if @address.save!
      redirect_to account_path(@account)
    else
      render :new
    end
  end

  private

  def address_params
    params.require(:address).permit(:street, :city, :state, :zip_code)
  end

end
