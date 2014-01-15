class BlogType < ActiveRecord::Base
  attr_accessible :name, :desc
  
  has_many :blogs, :dependent => :destroy
  
end
