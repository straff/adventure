class BoundaryObject

  attr_reader :description
  attr_reader :end_boundary
  
  def initialize( description:, end_boundary: true )
    @description = description
  end
  
  def to_s
    @description
  end
  
  def can_move_through?
    return false if @end_boundary
	return false if closed?
    return true
  end
  
  def no_move_reason
    return 'nowhere to go' if @end_boundary
    return "ouch ... it's closed" if closed?
    return "you just can't"
  end

end