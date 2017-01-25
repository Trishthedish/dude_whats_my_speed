class ServicesController < ApplicationController
  def index
    @service = Service.all
    

  end

  def show
  end

end
