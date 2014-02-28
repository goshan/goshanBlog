class CreateAttachments < ActiveRecord::Migration
  def up
    create_table :attachments do |t|
    	t.attachment :file
    	t.integer :blog_id

      t.timestamps
    end
  end

  def down
  	drop_table :attachments
  end
end
