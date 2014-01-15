class CreateBlogs < ActiveRecord::Migration
  def up
    create_table :blogs do |t|
      t.integer :blog_type_id, :default => 0
      t.string :title, :null => false
      t.text :text, :null => false
      t.integer :read_cnt, :default => 0

      t.timestamps
    end
  end
  
  def down
    drop_table :blogs
  end
end
