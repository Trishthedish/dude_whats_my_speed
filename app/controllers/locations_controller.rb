class LocationsController < ApplicationController

  def index
    @latitude = Geocoder.coordinates(params[:search])[0]
    @longitude = Geocoder.coordinates(params[:search])[1]
    @search_results = Broadband_Wrapper.search_broadband(@latitude,@longitude)
    if params[:search].present?
      @locations = Location.near(params[:search], 50, :order => :distance)
      render "locations/index"
    else
      @locations = Location.all
      render "locations/index"
    end
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new
    @location.address = params[:search]
    @location.latitude = Geocoder.coordinates(params[:search])[0]
    @location.longitude = Geocoder.coordinates(params[:search])[1]

    if @location.save
    else
      logger.debug "didnt create location"
      render 'new'
    end
  end
#adddress #lat longitude



  private
  def location_params
    params.require(:search)
  end

end
