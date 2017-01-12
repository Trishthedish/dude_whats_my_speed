class WelcomeController < ApplicationController

def index
  @search_results = Broadband_Wrapper.search_broadband

  if params[:search].present?
    @location = Location.new
  else


  end

end

end


#Geocoder.coordinates("25 East Hempishere.")
