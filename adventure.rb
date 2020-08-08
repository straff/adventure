
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
  
  show_debug current_place, facing_boundary, quester
  
  puts "\nYou are in #{quester.place.type} facing #{quester.facing_direction}. You see #{facing_boundary} "
  current_place.auto_action_fixtures
  
  quester.look
  current_place.look
  
  puts "---------------------------\n"
  response = STDIN.gets.chomp
  
  if response.length == 0; puts 'say something'; next; end
  if 'help'.match("^#{response}"); show_help; next; end
  
  action, object = get_action_object response # including aliasing
  
  # first check if objects will respond to 'action' for 'object'
  quester.send(action.to_sym, object, current_place) if quester.respond_to? action.to_sym
  current_place.send(action.to_sym, object) if current_place.respond_to? action.to_sym
  facing_boundary.send(action.to_sym, current_place, quester) if facing_boundary.respond_to? action.to_sym
  
  if mission.complete?
    puts 'Well done, you completed your mission'
    exit
  end
end
