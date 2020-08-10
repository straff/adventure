
require './place/places.rb'
require './adventure_helper.rb'
require './possessable_items.rb'
require './fixture_items.rb'
require './quester.rb'
require './mission.rb'
include AdventureHelper

ARGV.each do|arg|
  puts "Argument: #{arg}"
  if arg.match(/dbg/)
    DBG=TRUE
  end    
end
if defined? DBG
  DBG=false unless DBG
else
  DBG=false
end

def show_debug current_place, facing_boundary, quester
  dbg "current_place #{current_place}"
  dbg "current_place items #{current_place.items.inspect}" if current_place.items
  dbg "current_place fixtures #{current_place.fixtures.inspect}" if current_place.fixtures
  dbg "facing_direction #{quester.facing_direction}"
  dbg "facing_boundary #{facing_boundary}"
  dbg "quester possessions #{quester.possessions.inspect}" if quester.possessions
end

places = Places.new
places.build

quester = Quester.new 'Tom', 12, :west, places.locations['porch']

possessable_items = PossessableItems.new
possessable_items.put_in_locations places

fixture_items = FixtureItems.new
fixture_items.put_fixtures_in_locations places

mission = Mission.new ([ :key, :dishes, :chocolate_eggs, :screwdriver ]), 'Your mission is to collect a key, wash the dishes, collect a screwdriver, collect chocolate eggs. Sounds easy.'
mission.questers.push quester
mission.fixtures = fixture_items

mission.show
puts 'press the "any key" to continue'
STDIN.gets

while true
  facing_boundary = quester.facing_boundary ? quester.facing_boundary : facing_boundary
  current_place = quester.place
  
  #show_debug current_place, facing_boundary, quester
  
  puts "\nYou are in #{quester.place.description} facing #{quester.facing_direction}. You see #{facing_boundary.description} "
  current_place.auto_action_fixtures
  
  quester.look
  puts "To the North is #{current_place.north_boundary}"
  puts "To the East  is #{current_place.east_boundary}"
  puts "To the South is #{current_place.south_boundary}"
  puts "To the West  is #{current_place.west_boundary}"
  puts 'The following items are here:' if current_place.items.count > 0 or current_place.fixtures.count > 0
  current_place.items.each_pair {| item,value | puts "\t#{value.to_s} #{value.status_description}" }
  current_place.fixtures.each_pair {| fixture,value | puts "\t#{value.to_s} #{value.status_description}" }
  
  puts "---------------------------\n"
  response = STDIN.gets.chomp
  
  if response.length == 0; puts 'say something'; next; end
  if 'help'.match("^#{response}"); show_help; next; end
  
  action, object = get_action_object response # including aliasing
  dbg "action #{action}, object #{object}"
  
  dbg 'quester processing'
  if quester.respond_to? action.to_sym
    quester_action_response = quester.send(action.to_sym, object, current_place)
	puts quester_action_response
	quester_responded = true
  else
    dbg "quester did not respond - #{quester.name}"
	quester_responded = false
  end
    
  
  dbg 'current_place processing'
  if current_place.respond_to? action.to_sym
    place_action_result = current_place.send(action.to_sym, object) 
    puts place_action_result
	current_place_responded = true
  else
    dbg "current_place did not respond - #{current_place.description}" 
	current_place_responded = false
  end
  
  dbg 'facing_boundary'
  if facing_boundary.respond_to? action.to_sym
    facing_boundary_action_results = facing_boundary.send(action.to_sym, current_place, quester) 
	puts facing_boundary_action_results
	facing_boundary_responded = true
  else
    dbg "facing_boundary did not respond - #{facing_boundary.description}" 
    facing_boundary_responded = false
  end
  
  puts "#{action} is not a known action" if not quester_responded and not current_place_responded and not facing_boundary_responded
  
  if mission.complete?
    puts 'Well done, you completed your mission'
    exit
  end
end
