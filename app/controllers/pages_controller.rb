class PagesController < ApplicationController

  def home
    @vehicles = Vehicle.popular_cars
  end

end
