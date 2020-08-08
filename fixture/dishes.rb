require './fixture/fixture.rb'

class Dishes < Fixture
  
  CLEAN = false
  DIRTY = true
  
  def initialize name
    @name = name
    @status = DIRTY
    @status_description = '- dirty'
    @achieved = false
  end
    
  def to_s
    return @name
  end
  
  def clean
    @status = CLEAN
    @status_description = '- clean'
    @achieved = true
  end
    
end