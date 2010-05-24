class Project < ActiveRecord::Base
  
  has_and_belongs_to_many :tools
  
  
  def self.to_uri
    '/projects/'
  end
  
  def self.to_s
    'all projects'
  end
  
  validates_uniqueness_of :name, :slug
  before_validation :set_slug
  validates_format_of :slug, :with => /^[0-9a-z_]+$/
  
  attr_protected :slug
  
  def to_uri
    '/projects/' + slug
  end
  
  def to_s
    name
  end
  
  def tools=(tools_list)
    return self.tool_ids=(tools_list.map(&:id)) if tools_list.kind_of? Array
    if tools_list.kind_of? String
      self.tools.clear
      return tools_list.split(' ').each do |tool_name|
        self.tools.push(Tool.find_or_build_by_name(tool_name.downcase)) unless tool_name.blank?
      end
    end
  end
  
  def tools_with_joining
    JoiningArray.new(tools_without_joining)
  end
  
  alias_method_chain :tools, :joining
  
  def description_html
    BlueCloth::new(self[:description]).to_html
  end
  
  private
  
  def set_slug
    self.slug = name.downcase.gsub(/[^0-9a-z]/, '_').squeeze('_') if slug.blank?
  end
    
end