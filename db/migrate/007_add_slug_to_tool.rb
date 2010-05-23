class AddSlugToTool < ActiveRecord::Migration
  def self.up
    add_column :tools, :slug, :string
    Tool.all.each do |tool|
      tool.slug = tool.name.underscore
      tool.save!
    end
  end
  
  def self.down
    drop_column :tools, :slug
  end
end