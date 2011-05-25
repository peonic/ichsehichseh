class CreateParticipants < ActiveRecord::Migration
  def self.up
    create_table :participants do |t|

      t.string :name, :limit => 100, :null => false
      t.string :email, :limit => 100, :null => false
      t.string :street, :limit => 42, :null => false
      t.string :town, :limit => 42, :null => false
      t.string :zip, :limit => 5, :null => false
      t.string :telephone, :limit => 20, :null => false
      t.string :storyname, :limit => 42, :null => false
      t.string :password, :limit => 42, :null => false
      t.text :comment
      t.timestamps
    end
  end

  def self.down
    drop_table :participants
  end
end
