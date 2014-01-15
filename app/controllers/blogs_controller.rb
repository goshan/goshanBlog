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
  end
  
  def show
    @blog = Blog.find_by_id(params[:id])
  end
  
end
