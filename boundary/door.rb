require './boundary/boundary_object.rb'

class Door < BoundaryObject

  attr_accessor :door_state
  attr_accessor :lock_state
  
  def initialize type, door_state, lock_state, end_boundary = false
    @door_state = door_state
    @lock_state = lock_state
    @end_boundary = end_boundary
    super type, "a #{type} door"
  end
  
  def open place, quester
    puts 'door is locked' if locked?
    if unlocked?
      if closed?
        @door_state = :open 
      else 
        puts 'door is already open'
      end
    end
    dbg "door state #{door_state}"
  end
  def close place, quester
    if open?
      @door_state = :closed
    else 
      puts 'door is already closed'
    end
    dbg "door state #{door_state}"
  end
  
  def unlock place, quester
    puts 'unlocking door ...'
    if closed?
      if locked?
        if not quester.possessions[:key]
          puts 'you dont have a key'
          return
        end
        @lock_state = :unlocked
        puts 'unlocked'
      else
        puts 'already unlocked'
      end
    else
      puts 'is not closed'
    end
  end
  
  def lock place, quester
    puts 'locking door ...'
    if closed?
      if unlocked?
        if not quester.possessions[:key]
          puts 'you dont have a key'
          return
        end
        @lock_state = :locked
        puts 'locked'
      else
        puts 'already locked'
      end
    else
      puts 'is open'
    end
  end
  
  def closed?
    #puts '*** Testing *** - all doors set open'
    #return false
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