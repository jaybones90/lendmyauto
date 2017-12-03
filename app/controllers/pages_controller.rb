class PagesController < ApplicationController

  def home
    @vehicles = Vehicle.all.limit(3)
    @location = Location.new()
    @reservation = Reservation.new()
  end

end
