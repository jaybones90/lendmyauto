class SearchesController < ApplicationController
  before_action :format_dates, only: :index

  def index
    @search = Search.new()
    search_attributes = Search.new(search_params)
    search_attributes.date_start = @date_start
    search_attributes.date_end = @date_end
    if search_attributes.valid?
      @vehicles = Vehicle.get_available_vehicles(search_attributes)
      flash[:alert] = "No Available Vehicles For #{@date_start} - #{@date_end}" if @vehicles.empty?
    else
      render :index, :locals => { :@search => search_attributes }
    end
  end

  private

  def search_params
    params.require(:search).permit(:city)
  end

  def format_dates
    date_params = params[:search]
    @date_start = Date.civil(date_params["date_start(1i)"].to_i,
                            date_params["date_start(2i)"].to_i,
                            date_params["date_start(3i)"].to_i)
    @date_end = Date.civil(date_params["date_end(1i)"].to_i,
                            date_params["date_end(2i)"].to_i,
                            date_params["date_end(3i)"].to_i)
  end



end
