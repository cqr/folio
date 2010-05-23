class AddDescriptionToProjects < ActiveRecord::Migration
  
  def self.up
    add_column :projects, :description, :text
  end
  
  def self.down
    drop_column :projects, :description
  end
  
end