class CreateUploadItems < ActiveRecord::Migration
  def self.up
    create_table :upload_items do |t|
      t.integer :participants_id, :null => false
      t.string "title", :null => false
      t.string "content_type", :null => false
      t.string "filename", :null => false
      t.integer "size", :null => false
      t.text "description"
      t.timestamps
    end
  end

  def self.down
    drop_table :upload_items
  end
end
