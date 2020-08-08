require './boundary/boundary_object.rb'

class Way < BoundaryObject

  def initialize( type, description )
    super type, "a #{description}"
  end

  def can_move?
    return true
  end
  
end