class Attachment < ActiveRecord::Base
  attr_accessible :file, :blog_id

  has_attached_file :file, :path => ":rails_root/public/files/:filename", :url => "/files/:filename"

  belongs_to :blog
  
end
