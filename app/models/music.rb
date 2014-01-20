class Music < ActiveRecord::Base
  attr_accessible :sound, :blog_id
  
  has_attached_file :sound, :path => ":rails_root/public/musics/:filename", :url => "/musics/:filename"
  
  belongs_to :blog
  
end
