class UsersController < ApplicationController

  def index
    # @pi_data = RasberryPi.all
    # @ordered_data = @pi_data.order(:date)
    @users = User.all

  end

  def show
    @my_user = RasberryPi.find(params[:id])
    @my_pi = @my_user.rasberry_pis

    if @my_user == nil
      render :file => 'public/404.html', :status => :not_found
    end
  end



end
