require './adventure_helper.rb'
include AdventureHelper

class Quester

  attr_reader :name  
  attr_reader :age
  attr_reader :facing_direction
  attr_accessor :place
  
  attr_reader :directions
  attr_reader :compass_points
  
  attr_accessor :possessions
  
  def initialize name, age, facing_direction=:west, place=nil
    @name = name
    @age = age
    @facing_direction = facing_direction
    @place = place
    @possessions = Hash.new
    setup_direction_mapping
  end
  
  def facing_boundary
    if place.respond_to? ("#{@facing_direction}_boundary".to_sym)
      return place.send("#{@facing_direction}_boundary".to_sym)
    else
      return "can't go there"
    end
  end
  
  # get an object
  def get object, current_place
    return 'get what?' if not object 
    if current_place.items[object.to_sym]
      @possessions[object.to_sym] = current_place.items[object.to_sym]
      current_place.items.delete object.to_sym
      #if @possessions[object.to_sym].respond_to? :get
      #  @possessions[object.to_sym].get
        @possessions[object.to_sym].achieved = true
      #end
    else
      if @possessions[object.to_sym]
        return "you already have #{object}"
      else
        if current_place.fixtures[object.to_sym]
          return "you can not pick up #{object}"
        else
          return "there is no #{object} here"
        end
      end
    end
  end
  
  def drop object, current_place
    if @possessions[object.to_sym]
      current_place.items[object.to_sym] = @possessions[object.to_sym]
      @possessions[object.to_sym].achieved = false
      @possessions.delete object.to_sym
    else
      return "you don't have #{object}"
    end
  end
  
  def look
    possessions = "You have the no items"
    possessions = "You have the following items:" if @possessions.count > 0
    @possessions.each_pair do | possession,value | 
      status_msg = ''
      status_msg = "- #{value.status_description}" if value.respond_to? :status_description and value.status_description != ''
      possessions += "#{possession.to_s} #{status_msg}"
    end
    return possessions
  end

  def wash object, current_place
    return 'wash what?' if not object 
    return "there is no #{object} here" if not current_place.fixtures[object.to_sym] 
    if current_place.fixtures[object.to_sym].respond_to? :clean
      current_place.fixtures[object.to_sym].clean
    end
  end
   
 
  def move object, current_place
    if facing_boundary.can_move_through?
      @place = @place.send("#{facing_direction}_location".to_sym)
    else
      return facing_boundary.no_move_reason
    end
  end 

  def north object, current_place
    dbg "quester#north, object #{object}, current_place #{current_place}"
    @facing_direction = @directions[:north]
  end
  def south object, current_place
    dbg "quester#south, object #{object}, current_place #{current_place}"
    @facing_direction = @directions[:south]
  end
  def east object, current_place
    dbg "quester#east, object #{object}, current_place #{current_place}"
    @facing_direction = @directions[:east]
  end
  def west object, current_place
    dbg "quester#west, object #{object}, current_place #{current_place}"
    @facing_direction = @directions[:west]
  end
  
  def around object, current_place
    dbg "quester#around, object #{object}, current_place #{current_place}"
    @facing_direction = @directions[@compass_points[@facing_direction]-2]
  end
  def left object, current_place
    dbg "quester#left, object #{object}, current_place #{current_place}"
    @facing_direction = @directions[@compass_points[@facing_direction]+1]
  end
  def right object, current_place
    dbg "quester#right, object #{object}, current_place #{current_place}"
    @facing_direction = @directions[@compass_points[@facing_direction]-1]
  end
  
  def setup_direction_mapping
    @directions=Hash.new
    @directions[0]=:north
    @directions[1]=:west
    @directions[2]=:south
    @directions[3]=:east
    @directions[4]=:north
    @directions[5]=:west
    @directions[6]=:south
    
    @directions[:north]=:north
    @directions[:south]=:south
    @directions[:east]=:east
    @directions[:west]=:west
    
    @compass_points=Hash.new
    @compass_points[:north]=4
    @compass_points[:west]=5
    @compass_points[:south]=2
    @compass_points[:east]=3
  end
    
end