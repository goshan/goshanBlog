# -*- encoding: utf-8 -*-

module ToolsHelper
  
  def functions
    [["修改状态", admin_edit_admins_path(:type => "status")], 
    ["修改头像", admin_edit_admins_path(:type => "avatar")], 
    ["修改照片", admin_edit_admins_path(:type => "photo")], 
    ["修改简介", admin_edit_admins_path(:type => "desc")], 
    ["修改其他信息", admin_edit_admins_path(:type => "info")]]
  end
  
end
