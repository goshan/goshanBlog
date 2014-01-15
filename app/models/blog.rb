class Blog < ActiveRecord::Base
  attr_accessible :title, :blog_type_id, :text
  
  belongs_to :blog_type, :counter_cache => :blogs_count

  def get_type_name
    blog_type = BlogType.all
    blog_type[self.blog_type_id-1].name
  end
  
end
