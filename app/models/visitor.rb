class Visitor < ActiveRecord::Base
  attr_accessible :ip, :name, :last_access, :count, :location

  def display_name
  	if self.name && !self.name.empty?
  		self.name
  	else
  		ips = self.ip.split "."
  		"#{ips[0]}.#{ips[1]}.*.*"
  	end
  end

  def find_location
  	loc = GeoIP.new("#{Rails.root}/data/GeoLiteCity.dat").city(self.ip)
    if loc
      self.location = "#{loc[4]} #{loc[7]}"
      self.save
    end
  end

end
