class BoundaryObject

  attr_accessor :type
  attr_reader :description
  
  def initialize( type, description )
    @type = type
    @description = description
  end
  
  def to_s
    @description
  end
  
  def can_move?
    return false if closed?
    return false if @end_boundary
    return true
  end
  
  def no_move_reason
    return "ouch ... it's closed" if closed?
    return 'nowhere to go' if @end_boundary
    return "you just can't"
  end

end