class UsersController < ApplicationController

  def index
    @pi_data = RasberryPi.all
  end



end
