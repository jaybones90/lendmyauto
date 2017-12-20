class SearchesController < ApplicationController
  include DateRange

  def index
    @search = Search.new()
    search_attributes = Search.new(search_params)
    format_dates(search_attributes)
    if search_attributes.valid?
      @vehicles = Vehicle.get_available_vehicles(search_attributes)
      flash[:alert] = "No Available Vehicles For #{@date_start} - #{@date_end}" if @vehicles.empty?
    else
      render :index, :locals => { :@search => search_attributes }
    end
  end

  private

  def search_params
    params.require(:search).permit(:city, :date_range)
  end

  def format_dates(search_attrs)
    search_attrs.date_start = parse_start_date(search_params[:date_range])
    search_attrs.date_end = parse_end_date(search_params[:date_range])
  end


end
