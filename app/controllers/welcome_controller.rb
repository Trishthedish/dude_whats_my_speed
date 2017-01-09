class WelcomeController < ApplicationController

def index
  @search_results = Broadband_Wrapper.search_results(@lat_search, @long_search)
end

end
