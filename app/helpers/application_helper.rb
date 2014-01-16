module ApplicationHelper
  
  def admin_info
    admin = Admin.find_by_id(1)
    admin
  end
  
end
