class RasberryPiController < ApplicationController
  def index
    @pi_data = RasberryPi.all
    # render json: {status: 'SUCCESS', message: 'Loaded all posts', data: rasberry_pi}, status: :ok

  end

  def create
    # puts params.keys
    # logger.debug "Params keys #{params.keys}.awesome_inspect"
    # logger.debug "Params sub pi_data sub ping #{params['pi_data']['ping']}"
    # logger.debug "Params = #{params}"
    #
    # params.keys.each do |key|
    #   logger.debug "#{key}  =  #{params[key]}"
    # end
    p "----------------------"
    p "params: #{params[0]}"
    p "params.pi_data: #{params[:pi_data]}"
    p "params.pi_data.ping: #{params[:pi_data]['ping']}"
    p "params.pi_data.date_time BEFORE: #{params[:pi_data]['date_time']}"
    p "----------------------"
    @pi_data = RasberryPi.new
    @pi_data.ping = params[:pi_data]["ping"]
    @pi_data.download = params[:pi_data]["download"]
    @pi_data.upload = params[:pi_data]["upload"]
    @pi_data.date_time = DateTime.now
    # @pi_data.datetime = DateTime.now
    p "THE TIME IS: #{DateTime.now}"
    p "params.pi_data.date_time AFTER: #{params[:pi_data]['date_time']}"
    # p "params.pi_data.date_time w/o param AFTER: #{[:pi_data]['date_time']}"
    if @pi_data.save
      logger.debug "pi_data created bitch!"
      render json: {status: 'SUCCESS', message: 'Loaded all pi_data'}, status: :ok
    else
      logger.debug "didnt create pi_data"
      render json: {status: 'SUCCESS', message: 'Loaded all pi_data'}, status: :ok
    end
  end

#   NoMethodError (undefined method `respond_with' for #<RasberryPiController:0x007fde8a2891a8>
# Did you mean?  respond_to):
#


  def curl_post_example
      render text: "Thanks for sending a POST request with cURL! Payload: #{request.body.read}"
  end

  def show

  end


end




#curl -X POST -d "pi_data[ping]=20.00" -d "pi_data[download]=20.00" -d "pi_data[upload]=20.00"  http://localhost:3000/rasberry_pis/index

# curl -X POST -H "Content-Type: application/json" -d "${json}" https://maker.ifttt.com/trigger/speedtest/with/key/cJ-suGaqKnru9izr3qfo3A
#
#
#
# && curl -X POST -H "Content-Type:application/json"-d "${json}" https://dude-whats-my-speed.herokuapp.com/
#
# To make curl do the GET form post for you, just enter the expected created URL:
#
#  curl "http://www.hotmail.com/when/junk.cgi?birthyear=1905&press=OK"

# curl: "https://dude-whats-my-speed.herokuapp.com/rasberry_pis/?date="January 10, 2017at11:10AM"&ping="30.976"&download="5.09" &upload="9.6"
#
# # rasberry_pis
# # t.string   "date"
# # t.decimal  "ping"
# # t.decimal  "download"
# # t.decimal  "upload"
