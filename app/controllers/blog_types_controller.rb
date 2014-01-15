class BlogTypesController < ApplicationController
  
  before_filter :auth, :only => [:new, :create, :index, :show]
  
  layout "tools", :only => [:new, :index, :show]
  
  def new 
    @blog_type = BlogType.new
  end
  
  def create
    @blog_type = BlogType.new(params[:blog_type])
    @blog_type.save
    
    redirect_to blog_types_path
  end
  
  def index
    @default_blogs = Blog.where(:blog_type_id => 0)
    @blog_types = BlogType.all
  end
  
  def show
    @blog_type = BlogType.find_by_id(params[:id])
  end
  
end
