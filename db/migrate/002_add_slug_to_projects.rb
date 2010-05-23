class AddSlugToProjects < ActiveRecord::Migration
  
  def self.up
    add_column :projects, :slug, :string
    add_index :projects, :slug, :uniqe => true
    Project.all.each do |p|
      p.slug = p.name.underscore
      p.save!
    end
  end
  
  def self.down
    drop_column :projects, :slug
  end

end