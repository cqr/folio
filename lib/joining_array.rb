class JoiningArray
  def initialize(array)
    @object = array
  end
  
  def to_s
    @object.join(' ')
  end
  
  def each
    @object.each do |o|
      yield o
    end
    self
  end
  
  def method_missing(method, *args, &block)
    @object.send(method, *args, &block)
  end
end