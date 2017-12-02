class DriversLicensesController < ApplicationController

  def new
    @account = Account.find(params[:account_id])
    @license = @account.build_drivers_license()
  end

  def create
    @account = Account.find(params[:account_id])
    @license = @account.build_drivers_license(drivers_license_params)
    if @license.save!
      redirect_to account_path(@account)
    else
      render :new
    end
  end

  private

  def drivers_license_params
    params.require(:drivers_license).permit(:number, :expiration_date, :issue_date, image_attributes: [:id, :avatar, :_delete])
  end

end
