class Visitor < ActiveRecord::Base
  attr_accessible :ip, :name, :last_access, :count

  def display_name
  	if self.name && !self.name.empty?
  		self.name
  	else
  		ips = self.ip.split "."
  		"#{ips[0]}.#{ips[1]}.*.*"
  	end
  end
end
