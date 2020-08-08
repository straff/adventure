require './boundary/boundary_object.rb'

class Window < BoundaryObject

  attr_accessor :window_state
  attr_accessor :lock_state
  
  def initialize type, window_state, lock_state, end_boundary = false
    @window_state = window_state
    @lock_state = lock_state
    @end_boundary = end_boundary
    super type, 'a window'
  end
  
  def open place, quester
    if closed?
      if place.inside?
        @window_state = :open 
      else 
        puts 'can not open window from ouside'
      end
    else 
      puts 'window is already open'
    end
    dbg "window state #{window_state}"
  end
  def close place, quester
    if open?
      @window_state = :closed
    else 
      puts 'window is already closed'
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