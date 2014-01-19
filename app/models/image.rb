class Image < ActiveRecord::Base
  attr_accessible :img, :blog_id
  
  has_attached_file :img, :path => ":rails_root/public/images/:filename", :url => "/images/:filename"
  
  belongs_to :blog
  
end
