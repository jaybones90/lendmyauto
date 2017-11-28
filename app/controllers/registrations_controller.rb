class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :age, :phone_number, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :age, :phone_number, :email, :password, :password_confirmation, :current_password)
  end

  protected

  def after_sign_up_path_for(resource)
    account_path(resource)
  end

end
