class CreateBlogTypes < ActiveRecord::Migration
  def up
    create_table :blog_types do |t|
      t.string :name, :null => false
      t.string :desc
      t.integer :blogs_count, :default => 0

      t.timestamps
    end
  end
  
  def down 
    drop_table :blog_types
  end
end
