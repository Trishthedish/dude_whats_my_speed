class RasberryPiController < ApplicationController
  def index
    pi_data = Pi_data.all
    # render json: {status: 'SUCCESS', message: 'Loaded all posts', data: rasberry_pi}, status: :ok

  end

  def create
    puts params.keys
    logger.debug "Params keys #{params.keys}"
    logger.debug "Params sub pi_data sub ping #{params['pi_data']['ping']}"
    logger.debug "Params = #{params}"

    params.keys.each do |key|
      logger.debug "#{key}  =  #{params[key]}"
    end



    @pi_data = RasberryPi.new
    @pi_data.ping = params["pi_data"]["ping"]
    @pi_data.download = params["pi_data"]["download"]
    @pi_data.download = params["pi_data"]["upload"]
    if @pi_data.save
    else
      logger.debug "didnt create pi_data"
      render 'new'
    end
  end

  def curl_post_example
      render text: "Thanks for sending a POST request with cURL! Payload: #{request.body.read}"
  end




end





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
