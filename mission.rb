require './adventure_helper.rb'
include AdventureHelper

class Mission

  attr_accessor :description
  attr_accessor :questers
  attr_accessor :fixtures
  
  def initialize mission_elements, description
    @mission_elements = mission_elements
    @description = description
    @questers = []
  end
  
  def show
    puts '*********************************************************'
    puts "#{self.description}"
    puts '*********************************************************'
  end
  
  def complete?
    #dbg "@mission_elements #{@mission_elements}"
    #dbg "@fixtures.items #{@fixtures.items}"
    mission_elements_achieved = 0
    @questers.each do | quester |
      @mission_elements.each do | mission_element |
        mission_elements_achieved += 1 if quester.possessions[mission_element.to_sym] and quester.possessions[mission_element.to_sym].achieved?
      end
    end

    @fixtures.items.each_pair do | fixture_item_name,fixture_item |
      @mission_elements.each do | mission_element |
        mission_elements_achieved += 1 if fixture_item_name == mission_element and fixture_item.achieved?
      end
    end
    #dbg "mission_elements_achieved #{mission_elements_achieved}"
    #dbg "@mission_elements.count #{@mission_elements.count}"
    return true if @mission_elements.count == mission_elements_achieved
    return false
  end
    
end