class AdminsController < ApplicationController
  
  before_filter :auth, :except => [:admin_show]
  
  layout "tools", :except => [:admin_show]
  
  def admin_show
  end
  
  def info_edit
    @admin = Admin.find_by_id(1)
  end
  
  def status_edit
    @admin = Admin.find_by_id(1)
  end
  
  def avatar_edit
    @admin = Admin.find_by_id(1)
  end
  
  def photo_edit
    @admin = Admin.find_by_id(1)
  end
  
  def desc_edit
    @admin = Admin.find_by_id(1)
  end
  
  def admin_update
    @admin = Admin.find_by_id(1)
    @admin.update_attributes!(params[:admin])
    
    redirect_to tools_path
  end
  
end
