require_relative './fixture.rb'

class Safe < Fixture

  attr_reader :name
  attr_reader :status
  
  LOCKED = true
  UNLOCKED = false
  
  def initialize name
    @name = name
    @status = LOCKED
  end
    
  def unlock
    @status = UNLOCKED
  end
    
end