class CreateUploadItems < ActiveRecord::Migration
  def self.up
    create_table :upload_items do |t|
      t.integer "user_id", :null => false
      t.string "title"
      t.string "upload_content_type"
      t.string "upload_file_name"
      t.integer "upload_file_size"
      t.integer :width
      t.integer :height
      t.text "description"
      t.timestamps
    end
  end

  def self.down
    drop_table :upload_items
  end
end