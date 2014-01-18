class ToolsController < ApplicationController
  
  before_filter :auth
  
  layout "tools"
  
  def index
    @blogs = [Blog.all.count, Blog.where("created_at > ?", Time.now.beginning_of_day).count]
    @blog_types = [BlogType.all.count, BlogType.where("created_at > ?", Time.now.beginning_of_day).count]
  end
  
  def new_blog
    @blog = Blog.new
  end
  
  def create_blog
    @blog = Blog.create!(params[:blog])
    
    redirect_to blog_path(@blog)
  end
  
  def new_blog_type
    @blog_type = BlogType.new
  end
  
  def create_blog_type
    @blog_type = BlogType.create!(params[:blog_type])
    
    redirect_to blogs_path(:blog_type_id => @blog_type.id)
  end
  
end
