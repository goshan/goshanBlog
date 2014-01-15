class ApplicationController < ActionController::Base
  
  def auth
    authenticate_or_request_with_http_basic do |username, password|
      username == "goshan" && password == "goshansalt"
    end
  end
  
end
