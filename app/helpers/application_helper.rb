module ApplicationHelper
  
  def admin_info
    admin = Admin.find_by_id(1)
    admin
  end
  
  def hot_types
    types = BlogType.order("blogs_count desc").limit(5)
    types
  end
  
end
