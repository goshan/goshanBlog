class BlogType < ActiveRecord::Base
  attr_accessible :name, :desc, :blogs_count
  
  has_many :blogs, :dependent => :destroy
  
end
