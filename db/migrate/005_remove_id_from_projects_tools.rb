class RemoveIdFromProjectsTools < ActiveRecord::Migration
  def self.up
    remove_column :projects_tools, :id
  end
  
  def self.down
    add_column :projects_tools, :id, :integer
  end
end