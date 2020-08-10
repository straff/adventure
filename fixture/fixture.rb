class Fixture

  attr_reader :name
  attr_reader :status
  attr_reader :status_description
  #attr_accessor :achieved
  
  def initialize name:
    @name = name
    @status_description = ''
    @achieved = false
  end
  
  def to_s
    return @name
  end
  
  def achieved?
    return @achieved
  end  
    
end