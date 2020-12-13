require_relative './fixture.rb'

class Safe < Fixture
  
  LOCKED = true
  UNLOCKED = false
  
  def initialize name:, description:
    @status = LOCKED
    super name: name, description: description
  end
    
  def unlock
    @status = UNLOCKED
  end
    
end