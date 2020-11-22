require_relative './boundary_object.rb'

class Wall < BoundaryObject
  
  def initialize description:, end_boundary: true
    super description: description, end_boundary: end_boundary
  end
  def no_move_reason
    return "caaarunch ... you bumped into a solid wall"
  end
  
end