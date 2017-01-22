class UsersController < ApplicationController

  def index
    @pi_data = RasberryPi.all
    @ordered_data = @pi_data.order(:date)
  end



end
