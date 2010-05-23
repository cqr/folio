class CreateProjectsToolsJoinTable < ActiveRecord::Migration
  
  def self.up
    create_table :projects_tools do |t|
      t.references :project
      t.references :tool
    end
  end
  
  def self.down
    drop_table :projects
  end

end