require_relative './adventure_helper.rb'
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
  
  # get an entity
  def get entity, current_place
    return 'get what?' if not entity 
    if current_place.items[entity.to_sym]
      @possessions[entity.to_sym] = current_place.items[entity.to_sym]
      current_place.items.delete entity.to_sym
      #if @possessions[entity.to_sym].respond_to? :get
      #  @possessions[entity.to_sym].get
        @possessions[entity.to_sym].achieved = true
      #end
    else
      if @possessions[entity.to_sym]
        return "you already have #{entity}"
      else
        if current_place.fixtures[entity.to_sym]
          return "you can not pick up #{entity}"
        else
          return "there is no #{entity} here"
        end
      end
    end
  end
  
  def drop entity, current_place
    if @possessions[entity.to_sym]
      current_place.items[entity.to_sym] = @possessions[entity.to_sym]
      @possessions[entity.to_sym].achieved = false
      @possessions.delete entity.to_sym
    else
      return "you don't have #{entity}"
    end
  end
  
  def look entity, current_place
    possessions = "You have no items"
    possessions = "You have the following items:" if @possessions.count > 0
    @possessions.each_pair do | possession,value | 
      status_msg = ''
      status_msg = "- #{value.status_description}" if value.respond_to? :status_description and value.status_description != ''
      possessions += "#{possession.to_s} #{status_msg}"
    end
    return possessions
  end

  def wash entity, current_place
    return 'wash what?' if not entity 
    return "there is no #{entity} here" if not current_place.fixtures[entity.to_sym] 
    if current_place.fixtures[entity.to_sym].respond_to? :clean
      current_place.fixtures[entity.to_sym].clean
    end
  end
   
 
  def move entity, current_place
    if facing_boundary.can_move_through?
      @place = @place.send("#{facing_direction}_location".to_sym)
    else
      return facing_boundary.no_move_reason
    end
  end 

  def north entity, current_place
    dbg "quester#north, entity #{entity}, current_place #{current_place}"
    @facing_direction = @directions[:north]
  end
  def south entity, current_place
    dbg "quester#south, entity #{entity}, current_place #{current_place}"
    @facing_direction = @directions[:south]
  end
  def east entity, current_place
    dbg "quester#east, entity #{entity}, current_place #{current_place}"
    @facing_direction = @directions[:east]
  end
  def west entity, current_place
    dbg "quester#west, entity #{entity}, current_place #{current_place}"
    @facing_direction = @directions[:west]
  end
  
  def around entity, current_place
    dbg "quester#around, entity #{entity}, current_place #{current_place}"
    @facing_direction = @directions[@compass_points[@facing_direction]-2]
  end
  def left entity, current_place
    dbg "quester#left, entity #{entity}, current_place #{current_place}"
    @facing_direction = @directions[@compass_points[@facing_direction]+1]
  end
  def right entity, current_place
    dbg "quester#right, entity #{entity}, current_place #{current_place}"
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