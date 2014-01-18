class Admin < ActiveRecord::Base
  
  attr_accessible :name, :birthday, :company, :title, :qq, :weibo, :wechat, :mail, :status, :avatar, :photo
  
  has_attached_file :avatar, :path => ":rails_root/public/avatar/:filename", :url => "/avatar/:filename"
  has_attached_file :photo, :path => ":rails_root/public/photo/:filename", :url => "/photo/:filename"
  
  def print_desc
    self.desc.gsub(/\r\n/, "<br>/ ")
  end
  
end
