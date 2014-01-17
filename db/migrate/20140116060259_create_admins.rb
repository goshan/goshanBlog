class CreateAdmins < ActiveRecord::Migration
  def up
    create_table :admins do |t|
      t.string :name, :null => false
      t.string :birthday
      t.string :company
      t.string :title
      t.string :qq
      t.string :weibo
      t.string :wechat
      t.string :mail
      t.string :status
      t.string :desc
      t.attachment :avatar

      t.timestamps
    end
  end
  
  def down
    drop_table :admins
  end
end
