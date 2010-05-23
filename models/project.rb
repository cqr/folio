class Project < ActiveRecord::Base
  
  has_and_belongs_to_many :tools
  
  def self.to_uri
    '/projects/'
  end
  
  validates_uniqueness_of :name, :slug
  before_validation :set_slug
  
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
        self.tools.push(Tool.find_or_create_by_name(tool_name)) unless tool_name.blank?
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
    self.slug = name.underscore if slug.blank?
  end
    
end