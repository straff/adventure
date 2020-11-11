require './quester.rb'

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

quester = Quester.new 'Jo', 12

puts "Current direction is #{quester.facing_direction}"

quester.turn 'l'
puts "After turning left, current direction is #{quester.facing_direction}"
quester.turn 'l'
puts "After turning left, current direction is #{quester.facing_direction}"
quester.turn 'l'
puts "After turning left, current direction is #{quester.facing_direction}"
quester.turn 'l'
puts "After turning left, current direction is #{quester.facing_direction}"
puts ''

quester.turn 'r'
puts "After turning right, current direction is #{quester.facing_direction}"
puts ''

quester.turn 'a'
puts "After turning around, current direction is #{quester.facing_direction}"
puts ''


quester.turn 'north'
puts "After turning north current direction is #{quester.facing_direction}"
quester.turn 'south'
puts "After turning south current direction is #{quester.facing_direction}"
quester.turn 'east'
puts "After turning east current direction is #{quester.facing_direction}"
quester.turn 'west'
puts "After turning west current direction is #{quester.facing_direction}"

quester.turn 'n'
puts "After turning n current direction is #{quester.facing_direction}"
quester.turn 's'
puts "After turning s current direction is #{quester.facing_direction}"
quester.turn 'e'
puts "After turning e current direction is #{quester.facing_direction}"
quester.turn 'w'
puts "After turning w current direction is #{quester.facing_direction}"

