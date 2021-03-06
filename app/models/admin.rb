class Admin < ActiveRecord::Base
  
  attr_accessible :nick_name, :true_name, :birthday, :company, :title, :qq, :weibo, :wechat, :mail, :status, :desc, :avatar, :photo
  
  has_attached_file :avatar, :path => ":rails_root/public/avatar/:filename", :url => "/avatar/:filename"
  has_attached_file :photo, :path => ":rails_root/public/photo/:filename", :url => "/photo/:filename"
  
  def status
    status = Status.order("created_at desc").first
    status ? status.content : ""
  end
  
  def print_desc
    "/ #{self.desc.gsub("\r\n", "\r\n/ ")}"
  end
  
end
