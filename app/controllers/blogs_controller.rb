class BlogsController < ApplicationController
  
  before_filter :auth, :only => [:new, :create]
  
  layout "tools", :only => [:new]
  
  def new 
    @blog = Blog.new
  end
  
  def create
    @blog = Blog.new(params[:blog])
    @blog.save
  end
  
  def index
    @blogs = Blog.where(:blog_type_id => params[:blog_type_id]).order("updated_at desc")
  end
  
  def show
    @blog = Blog.find_by_id(params[:id])
    @blog.read_once
  end
  
  def home
    @blogs = Blog.order("updated_at desc").limit(10)
    
    render "index"
  end
  
end
