require_relative './fixture.rb'

class Dishes < Fixture
  
  CLEAN = false
  DIRTY = true
  
  def initialize name:, description:
    super name: name, description: description, status_description: 'dirty'
  end
      
  def clean
    @status = CLEAN
    @status_description = 'clean'
    @achieved = true
  end
    
end