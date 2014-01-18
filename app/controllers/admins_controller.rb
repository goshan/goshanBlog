class AdminsController < ApplicationController
  
  before_filter :auth, :except => [:admin_show]
  
  layout "tools"
  
  def admin_show
    @admin = Admin.find_by_id(1)
    render :layout => "no_side"
  end
  
  def admin_edit
    @type = params[:type]
    @admin = Admin.find_by_id(1)
  end
  
  def admin_update
    @admin = Admin.find_by_id(1)
    @admin.update_attributes!(params[:admin])
    
    redirect_to tools_path
  end
  
end
