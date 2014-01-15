class BlogsController < ApplicationController
  
  before_filter :auth, :only => [:new, :create]
  
  layout "tools", :only => [:new, :index]
  
  def new 
    @blog = Blog.new
  end
  
  def create
    @blog = Blog.new(params[:blog])
    @blog.save
  end
  
  def index
    @blogs = Blog.where(:blog_type_id => params[:blog_type_id])
  end
  
  def show
    @blog = Blog.find_by_id(params[:id])
  end
  
end
