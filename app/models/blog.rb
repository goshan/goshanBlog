class Blog < ActiveRecord::Base
  attr_accessible :title, :blog_type_id, :text
  
  belongs_to :blog_type, :counter_cache => :blogs_count

  def type_name
    blog_type = BlogType.all
    blog_type[self.blog_type_id-1].name
  end
  
  def update_time
    self.updated_at.strftime("%Y-%m-%d %H:%M")
  end
  
end
