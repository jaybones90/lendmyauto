class PagesController < ApplicationController

  def home
    @account = current_user.account
    @vehicle = @account.owned_vehicles.first
    @image = @vehicle.images.first
  end

end
