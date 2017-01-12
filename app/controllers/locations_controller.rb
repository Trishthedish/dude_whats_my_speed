class LocationsController < ApplicationController

  def index
    @search_results = Broadband_Wrapper.search_broadband
    @locations = Location.order('created_at DESC')
    render "welcome/index"

  end


  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
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
    params.require(:location).permit(:address, :latitude, :longitude)
  end

end
