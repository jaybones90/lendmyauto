class RegistrationsController < Devise::RegistrationsController


  protected

  def after_sign_up_path_for(resource)
    flash[:notice] = nil
    edit_account_path(resource)
  end

end
