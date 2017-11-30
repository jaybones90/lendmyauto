class AccountsController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @user = current_user
    @account = current_user.account
  end

end
