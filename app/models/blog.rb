# -*- encoding: utf-8 -*-

class Blog < ActiveRecord::Base
  before_save :check_count_changed
  
  attr_accessible :title, :blog_type_id, :text, :read_cnt
  
  belongs_to :blog_type, :counter_cache => :blogs_count

  has_many :comments, :dependent => :destroy, :order => "updated_at desc"
  
  has_many :images, :dependent => :destroy
  
  has_many :musics, :dependent => :destroy

  has_many :attachments, :dependent => :destroy

  def type_name
    blog_type = BlogType.all
    if self.blog_type
      self.blog_type.name
    else
      "默认分类"
    end
  end
  
  def update_time
    self.updated_at.strftime("%Y-%m-%d %H:%M")
  end
  
  def content_with_media
    imgs = {}
    self.images.each do |image|
      imgs[image.id.to_s.to_sym] = image.img.url
    end
    sounds = {}
    self.musics.each do |music|
      sounds[music.id.to_s.to_sym] = music.sound.url
    end
    attachs = {}
    attachs_name = {}
    self.attachments.each do |attach|
      attachs[attach.id.to_s.to_sym] = attach.file.url
      attachs_name[attach.id.to_s.to_sym] = attach.file_file_name
    end
    self.text
    .gsub(/<gImage id=[0-9]*>/) {|s| "<img class='blog_image' src='#{imgs[s.match(/([0-9]+)/)[1].to_sym]}'>"}
    .gsub(/<gMusic id=[0-9]*>/) {|s| "<audio controls><source src='#{sounds[s.match(/([0-9]+)/)[1].to_sym]}'>'Your browser does not support the audio element.'</audio>"}
    .gsub(/<gFile id=[0-9]*>/) {|s| "<a class='blog_attach' href='#{attachs[s.match(/([0-9]+)/)[1].to_sym]}'>#{attachs_name[s.match(/([0-9]+)/)[1].to_sym]}</a>"}
    .gsub(/<gCode content=/, "<pre class='code'>").gsub(/\/>/, "</pre>")
    .html_safe
  end
  
  def preview
    self.text
    .gsub(/<gImage id=[0-9]*>/, "[图片]")
    .gsub(/<gMusic id=[0-9]*>/, "[音乐]")
    .gsub(/<gFile id=[0-9]*>/, "[附件]")
    .gsub(/<a class='gLink' href='.*' target='blank'>.*<\/a>/, "[链接]")
    .gsub(/<gCode content=/, "").gsub(/\/>/, "")[0..200]
  end
  
  def read_once
    self.update_attributes(:read_cnt => self.read_cnt+1)
  end
  
  private
    def check_count_changed
      if self.blog_type_id_changed? && self.id
        BlogType.decrement_counter(:blogs_count, self.blog_type_id_change[0]) #decrement previously assigned Post's counter_cache
        BlogType.increment_counter(:blogs_count, self.blog_type_id_change[1]) #increment newly assigned Post's counter_cache
      end
    end
  
end
