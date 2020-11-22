require_relative './boundary_object.rb'

# though cupboard is a boundary object it's a bit special in that it represents the cupboard too ... it can have fixtures 
class Cupboard < BoundaryObject

  attr_accessor :cupboard_state
  
  attr_accessor :items
  attr_accessor :fixtures
  
  def initialize description:, end_boundary: true
    @description = description
    @cupboard_state = :closed
    @end_boundary = end_boundary
    @items = Hash.new
    @fixtures = Hash.new
  end
  
  def open place, quester
    dbg "cupboard door state #{cupboard_state}"
    if closed?
      @cupboard_state = :open
      dbg 'merging cupboard items and fixtures to place'
      place.items.merge!(self.items)
      self.items = Hash.new
      place.fixtures.merge!(self.fixtures)
      self.fixtures = Hash.new
      return 'cupboard opens'
    else
      return 'cupboard is already open'
    end
  end
  def close place, quester
    dbg "cupboard door state #{cupboard_state}"
    if open?
      @cupboard_state = :closed
	  return 'cupboard closes'
    else 
      return 'cupboard is already closed'
    end
  end
  
  def closed?
    return true if @cupboard_state == :closed
    return false
  end
  def open?
    return !closed?
  end
 
 end