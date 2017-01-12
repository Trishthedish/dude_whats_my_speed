class WelcomeController < ApplicationController

def index
  @search_results = Broadband_Wrapper.search_broadband
  # @locations = Location.all
  #
  # if params[:search]
  #   @locations = Location.search(params[:search])
  # else
  #   @locations = Location.all
  # end

end

def search
  @locations = Location.search(params[:query])
  render :index
end


end


#Geocoder.coordinates("25 East Hempishere.")
