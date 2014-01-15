class BlogsController < ApplicationController
  
  before_filter :auth, :include => [:new, :create, :index]
  
  layout "tools", :include => [:new, :index]
  
  def new 
    @blog = Blog.new
  end
  
  def create
    @blog = Blog.new(params[:blog])
    @blog.save
  end
  
  def index
  end
  
end
