
class Adventure
	require_relative './place/places.rb'
	require_relative './adventure_helper.rb'
	require_relative './possessable_items.rb'
	require_relative './fixture_items.rb'
	require_relative './quester.rb'
	require_relative './mission.rb'
	include AdventureHelper

	attr_accessor :questers
	attr_accessor :quester
	attr_reader   :places
	attr_reader   :possessable_items
	attr_reader   :fixture_items
	attr_reader   :mission


	# we have at least one quester, setup at start of adventure instance
	def initialize name, age, facing_direction=:west, place=nil
	  @places = Places.new
	  @places.build
    @places.validate

	  @possessable_items = PossessableItems.new
	  @possessable_items.put_in_locations places

	  @fixture_items = FixtureItems.new
	  @fixture_items.put_fixtures_in_locations places

	  @mission = Mission.new ([ :key, :dishes, :chocolate_eggs, :screwdriver ]), 'Your mission is to collect a key, wash the dishes, collect a screwdriver, collect chocolate eggs. Sounds easy.'
	  #@mission.questers[0].push quester
	  @mission.fixtures = fixture_items
	  
	  @questers = Hash.new
	  @quester = Quester.new name, age, facing_direction, places.locations['porch']
	  @questers[0] = @quester
	end
  
  def do_player_command command:, quester:, current_place:, facing_boundary:
  
    action, entity = get_action_entity command # including aliasing
    dbg "action #{action}, entity #{entity}"
    
    command_results = []
   
    dbg 'quester processing'
    #if adventure.quester.respond_to? action.to_sym
    if self.quester.respond_to? action.to_sym
      quester_action_response = self.quester.send(action.to_sym, entity, current_place)
      command_results << quester_action_response
      quester_responded = true
    else
      dbg "quester did not respond - #{self.quester.name}"
      quester_responded = false
    end
      
    dbg 'current_place processing'
    if current_place.respond_to? action.to_sym
      place_action_result = current_place.send(action.to_sym, entity) 
      command_results << place_action_result
      current_place_responded = true
    else
      dbg "current_place did not respond - #{current_place.description}" 
      current_place_responded = false
    end
    
    dbg 'facing_boundary processing'
    if facing_boundary.respond_to? action.to_sym
      facing_boundary_action_results = facing_boundary.send(action.to_sym, current_place, quester) 
      command_results << facing_boundary_action_results
      facing_boundary_responded = true
    else
      dbg "facing_boundary did not respond - #{facing_boundary.description}" 
      facing_boundary_responded = false
    end
    
    command_results << "#{action} is not a known action" if not quester_responded and not current_place_responded and not facing_boundary_responded
    
    return command_results

  end

	def show_debug current_place, facing_boundary, quester
	  dbg "current_place #{current_place}"
	  dbg "current_place items #{current_place.items.inspect}" if current_place.items
	  dbg "current_place fixtures #{current_place.fixtures.inspect}" if current_place.fixtures
	  dbg "facing_direction #{quester.facing_direction}"
	  dbg "facing_boundary #{facing_boundary}"
	  dbg "quester possessions #{quester.possessions.inspect}" if quester.possessions
	end
end
