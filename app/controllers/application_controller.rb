class ApplicationController < ActionController::Base

  before_filter :save_ip
  
  def auth
    authenticate_or_request_with_http_basic do |username, password|
      username == "goshan" && password == "goshansalt"
    end
  end

  def save_ip
  	visitor = Visitor.find_by_ip(request.remote_ip)
  	if visitor
  		if Time.now-visitor.last_access > 10.minutes
  			visitor.count += 1
  		end
  		visitor.last_access = Time.now
  		visitor.save
  	else
  		Visitor.create!(:ip => request.remote_ip, :last_access => Time.now)
  	end
  end
  
end
