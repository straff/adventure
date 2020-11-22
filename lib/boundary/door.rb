require_relative './boundary_object.rb'

class Door < BoundaryObject

  attr_accessor :door_state
  attr_accessor :lock_state
  
  def initialize description:, door_state: :closed, lock_state: :locked, end_boundary: false
    @description = description
    @door_state = door_state
    @lock_state = lock_state
    @end_boundary = end_boundary
  end
  
  def open place, quester
    dbg "door state #{door_state}"
    return 'door is locked' if locked?
    if closed?
      @door_state = :open
		  return 'door creaks open'
    else 
      return 'door is already open'
    end
  end
  def close place, quester
    if open?
      @door_state = :closed
	    return 'door creaks closed'
    else 
      return 'door is already closed'
    end
    dbg "door state #{door_state}"
  end
  
  def unlock place, quester
    if closed?
      if locked?
        if not quester.possessions[:key]
          return 'you dont have a key'
        end
        @lock_state = :unlocked
        return 'door unlocks'
      else
        return 'door is already unlocked'
      end
    else
      return 'door is already open'
    end
  end
  
  def lock place, quester
    if closed?
      if unlocked?
        if not quester.possessions[:key]
          return 'you dont have a key'
        end
        @lock_state = :locked
        return 'door is now locked'
      else
        return 'door is already locked'
      end
    else
      return 'cant lock an open door'
    end
  end
  
  def closed?
    return true if @door_state == :closed
    return false
  end
  def open?
    return !closed?
  end
  
  def unlocked?
    return true if @lock_state == :unlocked
    return false
  end
  def locked?
    return !unlocked?
  end
 
 end