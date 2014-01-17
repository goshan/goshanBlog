class AdminsController < ApplicationController
  
  before_filter :auth, :except => [:admin_show]
  
  layout "tools", :except => [:admin_show]
  
  def admin_show
  end
  
  def admin_edit
    @admin = Admin.find_by_id(1)
  end
  
  def admin_update
    @admin = Admin.find_by_id(1)
    @admin.update_attributes!(:name => params[:name], :birthday => params[:birthday], :company => params[:company], 
      :title => params[:title], :qq => params[:qq], :weibo => params[:weibo], :wechat => params[:wechat], 
      :mail => params[:mail])
  end
  
  def status_edit
    @status = Admin.find_by_id(1).status
  end
  
  def status_update
    @admin = Admin.find_by_id(1)
    @admin.update_attributes!(:status => params[:status])
  end
  
  def avatar_edit
    @admin = Admin.find_by_id(1)
  end
  
  def avatar_update
    @admin = Admin.find_by_id(1)
    @admin.update_attributes!(:avatar => params[:admin][:avatar])
  end
  
end
