class CreateImages < ActiveRecord::Migration
  def up
    create_table :images do |t|
      t.attachment :img
      t.integer :blog_id

      t.timestamps
    end
  end
  
  def down
    drop_table :images
  end
end
