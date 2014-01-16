class Admin < ActiveRecord::Base
  
  attr_accessible :name, :birthday, :company, :title, :qq, :weibo, :wechat, :mail, :status, :avatar
  has_attached_file :avatar, :path => ":rails_root/public/avatar/:filename", :url => "/avatar/:filename"
  
end
