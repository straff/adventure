class Fixture

  attr_reader :name
  attr_reader :description
  attr_accessor :status
  attr_accessor :status_description
  attr_accessor :achieved
  
  def initialize name:, description:, status_description: nil
    @name = name
    @description = description
    @status = false
    @status_description = status_description
    @achieved = false
  end
  
  def to_s
    return "#{@description}" unless @status_description
    return "#{@description} - #{@status_description}" 
  end
  
  def achieved?
    return @achieved
  end  
    
end