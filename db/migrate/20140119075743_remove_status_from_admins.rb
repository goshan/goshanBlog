class RemoveStatusFromAdmins < ActiveRecord::Migration
  def up
    remove_column :admins, :status
  end

  def down
    add_column :admins, :status
  end
end
