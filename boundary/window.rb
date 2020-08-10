require './boundary/boundary_object.rb'

class Window < BoundaryObject

  attr_accessor :window_state
  attr_accessor :lock_state
  
  def initialize description:, end_boundary: false
    @description = description
    @window_state = :closed
    @lock_state = :locked
    @end_boundary = end_boundary
  end
  
  def open place, quester
    if closed?
      if place.inside?
        @window_state = :open
		return 'the window creaks, and opens'
      else 
        return 'can not open window from outside'
      end
    else 
      return 'window is already open'
    end
    dbg "window state #{window_state}"
  end
  def close place, quester
    if open?
      @window_state = :closed
	  return 'the window closes'
    else 
      return 'window is already closed'
    end
    dbg "window state #{window_state}"
  end
  
  def closed?
    return true if @window_state == :closed
    return false
  end
  def open?
    return !closed?
  end

end