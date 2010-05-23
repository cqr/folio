class AddToolsTable < ActiveRecord::Migration
  
  def self.up
    create_table :tools do |t|
      t.string :name
            
      t.timestamps
    end
    add_index :tools, :name, :unique => true
  end
  
  def self.down
    drop_table :tools
  end
end