class AddImageUrlToProject < ActiveRecord::Migration
  
  def self.up
    add_column :projects, :image_url, :string
  end
  
  def self.down
    drop_column :projects, :image_url
  end
  
end