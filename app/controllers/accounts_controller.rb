class AccountsController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @account = Account.find(params[:id])
    @user = @account.user
  end

end
