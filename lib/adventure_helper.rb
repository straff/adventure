module AdventureHelper

  attr_reader :compass_points
  
  def show_help
    puts '*** Help when you need it ***'
    puts ''
    puts 'You can turn direction by:'
    puts '  turn left, right, around (single letter L, R or A lowercase)'
    puts ''
    puts '  stating a compass direction to turn to: N, S, E, W (single letter, lowercase)'
    puts ''
    puts 'You can walk or go to move'
    puts ''
    #puts 'You can look. It will tell you what is around'
    puts "If there are items in the place you are you can 'get' them, and sometimes you'll need them"
    
  end
  
  def get_action_entity response
    return '' if not response or response.length == 0 or response.strip.empty?
    splitted = response.split(' ')
    action = splitted[0]
    object = splitted[1] if splitted.count >= 2
    # note that some aliasing is checking start of string only but others are start to end (exact match)
    action = 'open' if 'open'.match("^#{action}")
    action = 'move' if 'move'.match("^#{action}") or 'go'.match("^#{action}") or 'walk'.match("^#{action}$") or 'run'.match("^#{action}$")
    action = 'get' if 'take'.match("^#{action}$") or 'grab'.match("^#{action}$") or 'pickup'.match("^#{action}")
    action = 'look' if 'see'.match("^#{action}$") or 'spy'.match("^#{action}$")
    (object = action; action = 'move') if compass_direction? compass_point: object
    action = 'south' if 'south'.match("^#{action}")
    action = 'east' if 'east'.match("^#{action}")
    action = 'west' if 'west'.match("^#{action}")
    action = 'around' if 'around'.match("^#{action}")
    action = 'left' if 'left'.match("^#{action}")
    action = 'right' if 'right'.match("^#{action}")
    action = 'wash' if 'clean'.match("^#{action}")
    return action, object
  end
  
  def compass_direction? compass_point:
    return false if compass_point.nil?
    return true if compass_point.match('north') or compass_point.match('south') or compass_point.match('east') or compass_point.match('west')
	return false
  end	
    
  def dbg (msg)
    if defined? DBG and DBG
      puts "DBG: #{msg}"
    end
  end
  
end