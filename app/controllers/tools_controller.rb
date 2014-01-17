class ToolsController < ApplicationController
  
  before_filter :auth
  
  layout "tools"
  
  def index
    @blogs = [Blog.all.count, Blog.where("created_at > ?", Time.now.beginning_of_day).count]
    @blog_types = [BlogType.all.count, BlogType.where("created_at > ?", Time.now.beginning_of_day).count]
  end
  
end
