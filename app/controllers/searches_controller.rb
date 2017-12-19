class SearchesController < ApplicationController
  before_action :parse_date_range, only: :index

  def index
    @search = Search.new()
    search_attributes = Search.new(search_params)
    search_attributes.date_start = @start_date
    search_attributes.date_end = @end_date
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

  def parse_date_range
    split_dates = search_params[:date_range].split(' - ')
    @start_date = Date.strptime(split_dates[0], '%m/%d/%Y')
    @end_date = Date.strptime(split_dates[1], '%m/%d/%Y')
    return @start_date, @end_date
  end

end
