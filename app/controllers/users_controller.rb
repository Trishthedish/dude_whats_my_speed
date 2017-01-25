class UsersController < ApplicationController

  def index
    @users = User.all
    @pi_data = RasberryPi.all
    # @ordered_data = @pi_data.order(:date)

    @ping_data = []
    @download_data = []
    @upload_data = []

    @pi_data.each do |pi_entry|
      @ping_data.push ([ pi_entry.date_time, pi_entry.ping  ])
    end

    @pi_data.each do |pi_entry|
      @download_data.push ([pi_entry.date_time, pi_entry.download])
    end

    @pi_data.each do |pi_entry|
      @upload_data.push([pi_entry.date_time, pi_entry.upload])
    end

  end

  def new
    @myuser = User.new
    @user_method = :post
    @user_path = users_path
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
  @myuser = User.find(params[:id])
  @user_method = :put
  @user_path = users_update_path(@myuser.id)
  if @myuser == nil
    render :file => 'public/404.html', :status => :not_found
  end
end


end
