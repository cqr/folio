class Tool < ActiveRecord::Base
  has_and_belongs_to_many :projects
  
  validates_uniqueness_of :name, :slug
  
  before_validation :set_slug
  
  def to_s
    name
  end
  
  def to_uri
    '/tools/' + slug
  end
  
  private
  
  def set_slug
    self.slug = self.name.underscore if slug.blank?
  end
  
  def self.to_uri
    '/tools'
  end
end