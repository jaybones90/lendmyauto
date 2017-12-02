class PagesController < ApplicationController

  def home
    @vehicles = Vehicle.all.limit(3)
  end

end
