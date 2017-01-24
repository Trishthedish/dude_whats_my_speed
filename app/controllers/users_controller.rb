class UsersController < ApplicationController

  def index
    # @pi_data = RasberryPi.all
    # @ordered_data = @pi_data.order(:date)
    @users = User.all

  end

  def create
    @myuser = User.new
    @myuser.name = params[:user][:name]
    @myuser.monthly_cost = params[:user][:name]
    @myuser.paid_download = params[:user][:name]
    @myuser.paid_upload = params[:user][:name]
    @myuser.area_code = params[:user][:name]
    @myuser.service_provider = params[:user][:name]
    if @myuser.save
      logger.debug "user created!"
      render json: {status: "SUCCESS", message: "loaded all user data."}, status: :ok
    end

  end

  def show
    @myuser = User.find(params[:id])
    @mypi = @myuser.rasberry_pis

    if @myuser == nil
      render :file => 'public/404.html', :status => :not_found
    end
  end

def edit

end


end
