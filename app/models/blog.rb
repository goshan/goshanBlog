# -*- encoding: utf-8 -*-

class Blog < ActiveRecord::Base
  attr_accessible :title, :blog_type_id, :text, :read_cnt
  
  belongs_to :blog_type, :counter_cache => :blogs_count
  
  has_many :images, :dependent => :destroy

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
  
  def content_with_images
    imgs = {}
    self.images.each do |image|
      imgs[image.id.to_s.to_sym] = image.img.url
    end
    self.text.gsub(/<gImage id=[0-9]*>/) {|s| "<img class='blog_image' src='#{imgs[s.match(/([0-9]+)/)[0].to_sym]}'/>"}.html_safe
  end
  
  def preview
    self.text.gsub(/<gImage id=[0-9]*>/, "[图片]")[0..200]
  end
  
  def read_once
    self.update_attributes(:read_cnt => self.read_cnt+1)
  end
  
end
