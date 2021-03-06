class AccountsController < ApplicationController
  before_action :authenticate_user!

  def show
    @account = current_user.account
    @vehicles = @account.owned_vehicles
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    @account = Account.find(params[:id])
    @account.update(account_params)
    if @account.save
      redirect_if_license_is_nil
    else
      render :edit
    end
  end

  private

  def account_params
    params.require(:account).permit(:user_first_name, :user_last_name, :user_birth_date, :user_phone_number, image_attributes: [:id, :avatar, :_delete])
  end

  def redirect_if_license_is_nil
    unless @account.drivers_license.nil?
      redirect_to account_path(@account)
    else
      redirect_to new_account_drivers_license_path(@account)
    end
  end


end
