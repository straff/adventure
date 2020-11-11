require_relative './boundary_object.rb'

# though cupboard is a boundary object it's a bit special in that it represents the cupboard too ... it can have fixtures 
class Cupboard < BoundaryObject

  attr_accessor :cupboard_state
  
  attr_accessor :items
  attr_accessor :fixtures
  
  def initialize type, cupboard_state, end_boundary = true
    @cupboard_state = cupboard_state
    @end_boundary = end_boundary
    @items = Hash.new
    @fixtures = Hash.new
    super type, "a #{type} door"
  end
  
  def open place, quester
    if closed?
      @cupboard_state = :open
      dbg 'merging cupboard items and fixtures to place'
      place.items.merge!(self.items)
      self.items = Hash.new
      place.fixtures.merge!(self.fixtures)
      self.fixtures = Hash.new
	  return 'cupboard opens'
    else 
      return 'cupboard door is already open'
    end
    dbg "cupboard door state #{cupboard_state}"
  end
  def close place, quester
    if open?
      @cupboard_state = :closed
	  return 'cupboard closes'
    else 
      return 'cupboard door is already closed'
    end
    dbg "cupboard door state #{cupboard_state}"
  end
  
  def closed?
    return true if @cupboard_state == :closed
    return false
  end
  def open?
    return !closed?
  end
 
 end