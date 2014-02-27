# -*- encoding: utf-8 -*-

class ToolsController < ApplicationController
  
  before_filter :auth
  
  layout "tools"
  
  def index
    @statuses = [Status.all.count, Status.where("created_at > ?", Time.now.beginning_of_day).count]
    @blogs = [Blog.all.count, Blog.where("created_at > ?", Time.now.beginning_of_day).count]
    @blog_types = [BlogType.all.count, BlogType.where("created_at > ?", Time.now.beginning_of_day).count]
    @comments = [Comment.all.count, Comment.where("created_at > ?", Time.now.beginning_of_day).count]
    @visitors = [Visitor.all.count, Visitor.where("last_access > ?", Time.now.beginning_of_day).count]
  end
  
  def new_blog
    @blog = Blog.new
  end
  
  def create_blog
    # 1. get image and blog content
    img = params[:blog][:image]
    mus = params[:blog][:music]
    params[:blog].delete(:image)
    params[:blog].delete(:music)
    # 2. save blog no matter image or submit
    @blog = Blog.create!(params[:blog])
    
    if params[:commit] == "upload"
      # 3. when upload save image if thereis
      if img
        @image = Image.create!(:img => img, :blog_id => @blog.id)
      end
      if mus
        @music = Music.create!(:sound => mus, :blog_id => @blog.id)
      end
      
      redirect_to edit_blog_tools_path(:blog_id => @blog.id)
    else
      # 4. or ignore image
      redirect_to blog_path(@blog)
    end
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
    # 1. get image and blog
    img = params[:blog][:image]
    mus = params[:blog][:music]
    params[:blog].delete(:image)
    params[:blog].delete(:music)
    # 2. save blog no matter image or submit 
    @blog = Blog.find_by_id(params[:blog_id])
    if @blog
      @blog.update_attributes!(params[:blog])
    else
      render :text => "未知blog_id"
    end
    
    if params[:commit] == "upload"
      # 3. when upload save image if there is
      if img
        @image = Image.create!(:img => img, :blog_id => @blog.id)
      end
      if mus
        @music = Music.create!(:sound => mus, :blog_id => @blog.id)
      end
      
      redirect_to edit_blog_tools_path(:blog_id => @blog.id)
    else 
      # 4. or ignore image and submit
      redirect_to blog_path(@blog)
    end
  end

  def delete_blog
    @blog = Blog.find_by_id(params[:blog_id])
    if @blog
      @blog.destroy
      redirect_to list_blogs_tools_path
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
      redirect_to blog_types_path
    else
      render :text => "未知blog_type_id"
    end
  end

  def delete_blog_type
    @blog_type = BlogType.find_by_id(params[:blog_type_id])
    if @blog_type
      Blog.where(:blog_type_id => @blog_type.id).each do |blog|
        blog.update_attributes!(:blog_type_id => 0)
      end
      @blog_type.destroy
      redirect_to list_blog_types_tools_path
    else
      render :text => "未知blog_type_id"
    end
  end

  def list_comments
    page = params[:page] || 1
    @comments = Comment.order("updated_at desc").paginate(:page => page, :per_page => 20)
  end
  
  def delete_comment
    @comment = Comment.find_by_id(params[:comment_id])
    if @comment
      @comment.destroy
      redirect_to list_comments_tools_path
    else
      render :text => "未知comment_id"
    end
  end

  def list_visitors
    page = params[:page] || 1
    @visitors = Visitor.order("last_access desc").paginate(:page => page, :per_page => 20)
  end

end
