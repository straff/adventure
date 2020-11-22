
require 'yaml'

viagem= false

ARGV.each do|arg|
  puts "Argument: #{arg}"
  DBG=true if arg.match(/dbg/)
  viagem=true if arg.match(/gem/)
end
if defined? DBG
  DBG=false unless DBG
else
  DBG=false
end

if viagem
  gem 'adventure'  #, path: 'C:/Users/Straff/dev/adventure/gems'
  puts "Running via gem version #{Gem.loaded_specs['adventure'].version}"
  require 'adventure.rb'
else
  require './lib/adventure.rb'
end

puts 'press the "any key" to continue, "load" to get saved game back'
response = STDIN.gets.chomp
if response.match('load')
  serialised_adventure = File.read('./serialised.txt')
  adventure = YAML.load(serialised_adventure)
else
  adventure = Adventure.new 'Tom', 12
end
#adventure.quester = Quester.new 'Tom', 12, :west, places.locations['porch']

adventure.mission.show

while true
  facing_boundary = adventure.quester.facing_boundary ? adventure.quester.facing_boundary : facing_boundary
  current_place = adventure.quester.place
  quester = adventure.quester
  
  #show_debug current_place, facing_boundary, quester
  
  puts "\nYou are in #{adventure.quester.place.description} facing #{adventure.quester.facing_direction}. You see #{adventure.quester.facing_boundary.description} "
  current_place.auto_action_fixtures
  
  quester.look '',''
  puts "To the North is #{current_place.north_boundary}"
  puts "To the East  is #{current_place.east_boundary}"
  puts "To the South is #{current_place.south_boundary}"
  puts "To the West  is #{current_place.west_boundary}"
  puts 'The following items are here:' if current_place.items.count > 0 or current_place.fixtures.count > 0
  current_place.items.each_pair {| item,value | puts "\t#{value.to_s} #{value.status_description}" }
  current_place.fixtures.each_pair {| fixture,value | puts "\t#{value.to_s} #{value.status_description}" }
  
  puts "---------------------------\n"
  command = STDIN.gets.chomp
  
  #if response.length == 0; puts 'say something'; next; end
  #if 'help'.match("^#{response}"); show_help; next; end
    
  exit if command.match('quit') 
  File.write('./serialised.txt', (YAML.dump(adventure)) ) if command.match('save') 
  
  command_results = adventure.do_player_command command: command, quester: quester, current_place: current_place, facing_boundary: facing_boundary
  command_results.each { |array_item| puts array_item }
  
  if adventure.mission.complete?
    puts 'Well done, you completed your mission'
    exit
  end
end
