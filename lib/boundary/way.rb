require_relative './boundary_object.rb'

class Way < BoundaryObject

  def initialize description:, end_boundary: false
    @description = description
    @end_boundary = end_boundary
    #super description, end_boundary
  end

  def can_move_through?
    return true
  end
  
end