class SearchesController < ApplicationController
  include DateRange

  def create
    search_attributes = Search.new(search_params)
    if search_attributes.valid?
      @vehicles = Vehicle.get_available_vehicles(search_attributes)
      render :index
    else
      render :index, :locals => { :@search => search_attributes }
    end
  end

  private

  def search_params
    params.require(:search).permit(:city, :date_start, :date_end)
  end




end
