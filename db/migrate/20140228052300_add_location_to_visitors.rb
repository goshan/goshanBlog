class AddLocationToVisitors < ActiveRecord::Migration
  def up
  	add_column :visitors, :location, :string
  end

  def down
  	remove_column :visitors, :location
  end
end
