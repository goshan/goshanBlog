class CreateVisitors < ActiveRecord::Migration
  def up
    create_table :visitors do |t|
    	t.string :ip
    	t.string :name
    	t.integer :count, :default => 1
      t.datetime :last_access

      t.timestamps
    end
  end

  def down
  	drop_table :visitors
  end
end
