class CreateMusics < ActiveRecord::Migration
  def up
    create_table :musics do |t|
      t.attachment :sound
      t.integer :blog_id

      t.timestamps
    end
  end
  
  def down 
    drop_table :musics
  end
end
