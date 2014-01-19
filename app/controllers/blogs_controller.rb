class BlogsController < ApplicationController
  
  def index
    @blogs = Blog.where(:blog_type_id => params[:blog_type_id]).order("created_at desc")
  end
  
  def show
    @blog = Blog.find_by_id(params[:id])
    @blog.read_once
  end
  
  def home
    @blogs = Blog.order("created_at desc").limit(10)
    
    render "index"
  end
  
end
