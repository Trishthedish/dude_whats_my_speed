class WelcomeController < ApplicationController

def index
  @search_results = Broadband_Wrapper.search_broadband()

end

end
