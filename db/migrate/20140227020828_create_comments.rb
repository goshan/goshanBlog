class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
    	t.integer :visitor_id, :null => false
    	t.string :content, :null => false
      t.integer :blog_id, :null => false
      t.boolean :is_valid, :default => true

      t.timestamps
    end
  end

  def down 
  	drop_table :comments
  end
end
