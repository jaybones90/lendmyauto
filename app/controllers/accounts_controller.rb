class AccountsController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @account = Account.find(params[:id])
    @user = @account.user
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    @account = Account.find(params[:id])
    @account.update(account_params)
    if @account.save!
      redirect_to account_path(@account)
    else
      render :edit
    end
  end

  private

  def account_params
    params.require(:account).permit(:user_first_name, :user_last_name, :user_birth_date, :user_phone_number)
  end

end
