require './boundary/boundary_object.rb'

class Wall < BoundaryObject

  attr_accessor :colour
  
  def initialize( type, colour )
    @colour = colour
    super type, "a #{colour} #{type} wall"
  end
  
  def can_move?
    return false
  end
  
  def no_move_reason
    return 'hmmm ... this is a wall'
  end
  
end