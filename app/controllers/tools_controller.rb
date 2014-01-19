# -*- encoding: utf-8 -*-

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
  
  def list_blogs
    page = params[:page] || 1
    @blogs = Blog.order("created_at desc").paginate(:page => page, :per_page => 20)
  end
  
  def edit_blog
    @blog = Blog.find_by_id(params[:blog_id])
    unless @blog
      render :text => "未知blog_id"
    end
  end
  
  def update_blog
    @blog = Blog.find_by_id(params[:blog_id])
    if @blog
      @blog.update_attributes!(params[:blog])
      redirect_to blog_path(@blog)
    else
      render :text => "未知blog_id"
    end
  end
  
  def new_blog_type
    @blog_type = BlogType.new
  end
  
  def create_blog_type
    @blog_type = BlogType.create!(params[:blog_type])
    
    redirect_to blogs_path(:blog_type_id => @blog_type.id)
  end
  
  def list_blog_types
    page = params[:page] || 1
    @blog_types = BlogType.paginate(:page => page, :per_page => 20)
    @default_blogs = Blog.where(:blog_type_id => 0)
  end
  
  def edit_blog_type
    @blog_type = BlogType.find_by_id(params[:blog_type_id])
    unless @blog_type
      render :text => "未知blog_type_id"
    end
  end
  
  def update_blog_type
    @blog_type = BlogType.find_by_id(params[:blog_type_id])
    if @blog_type
      @blog_type.update_attributes!(params[:blog_type])
      redirect_to blogs_path(:blog_type_id => @blog_type.id)
    else
      render :text => "未知blog_type_id"
    end
  end
  
end
