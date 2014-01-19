# -*- encoding: utf-8 -*-

class Blog < ActiveRecord::Base
  attr_accessible :title, :blog_type_id, :text, :read_cnt
  
  belongs_to :blog_type, :counter_cache => :blogs_count

  def type_name
    blog_type = BlogType.all
    if self.blog_type_id == 0
      "默认分类"
    else
      blog_type[self.blog_type_id-1].name
    end
  end
  
  def update_time
    self.updated_at.strftime("%Y-%m-%d %H:%M")
  end
  
  def preview
    self.text[0..200]
  end
  
  def read_once
    self.update_attributes(:read_cnt => self.read_cnt+1)
  end
  
end
