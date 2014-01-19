class CreateStatuses < ActiveRecord::Migration
  def up
    create_table :statuses do |t|
      t.string :content

      t.timestamps
    end
  end
  
  def down 
    drop_table :statuses
  end
end
