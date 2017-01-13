class LocationsController < ApplicationController

  def index
    @search_results = Broadband_Wrapper.search_broadband

    # @locations = Location.all


    if params[:search].present?
      @locations = Location.near(params[:search], 50, :order => :distance)
      render "welcome/index"

    else
      @locations = Location.all
      render "welcome/index"
    end
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(params[:search])

    @longitude = Geocoder.coordinates(params[:search])[0]
    @latitude = Geocoder.coordinates(params[:search])[1]


    @params = location_params
    @params = params
    if @location.save

      logger.debug "Location: #{@location.attributes.inspect}"
      flash[:success] = "Location added!"
      redirect_to root_path
    else
      logger.debug "didnt create location"
      render 'new'
    end
  end


  private
  def location_params
    params.require(:search)
  end

end
