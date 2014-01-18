# -*- encoding: utf-8 -*-

module ToolsHelper
  
  def functions
    [["修改状态", status_edit_admins_path], 
    ["修改头像", avatar_edit_admins_path], 
    ["修改简介", "/desc_edit"], 
    ["修改其他信息", info_edit_admins_path]]
  end
  
end
