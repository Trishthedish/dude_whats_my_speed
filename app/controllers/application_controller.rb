class ApplicationController < ActionController::Base
  include Stormpath::Rails::Controller
  # protect_from_forgery with: :exception
  protect_from_forgery prepend:
  true
  # skip before action may only be helpful within rasberry_pi controllr.Trying it here to see if this will work as well.
end
