require './boundary/boundary_object.rb'

class Way < BoundaryObject

  def initialize( description: )
    @description = description
  end

  def can_move_through?
    return true
  end
  
end