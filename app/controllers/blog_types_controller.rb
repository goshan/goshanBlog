class BlogTypesController < ApplicationController
  
  def index
    @default_blogs = Blog.where(:blog_type_id => 0)
    @blog_types = BlogType.all
  end
  
end
