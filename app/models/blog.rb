class Blog < ActiveRecord::Base
  attr_accessible :title, :blog_type_id, :text
  
  belongs_to :blog_type, :counter_cache => :blogs_count
  
end
