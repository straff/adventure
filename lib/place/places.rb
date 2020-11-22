require_relative './Place.rb'
require_relative '../boundary/Door.rb'
require_relative '../boundary/Cupboard.rb'
require_relative '../boundary/Window.rb'
require_relative '../boundary/Wall.rb'
require_relative '../boundary/Way.rb'

class Places

  attr_accessor :locations
  
  def add_to_locations place_object
    raise "this is wrong - place_object id #{place_object.id} already exists" if @locations[place_object.id]
    @locations[place_object.id] = place_object    
  end
  
  def build
  
    @locations = Hash.new

    porch = Place.new id: 'porch', description: 'a pink tiled porch area', inside: false
    porch.west_boundary = Door.new description: 'a heavy wooden door', lock_state: :unlocked
    porch.south_boundary = Window.new description: 'a glass window'
    porch.east_boundary = Door.new description: 'a glass door'
    porch.north_boundary = Wall.new description: 'a pale green wall' 
    add_to_locations porch

    workshop = Place.new id: 'workshop', description: 'a productive place'
    workshop.west_boundary = porch.east_boundary
    workshop.south_boundary = Door.new description: 'a metal roller door', end_boundary: true
    workshop.east_boundary = Wall.new description: 'a white painted plaster wall'
    workshop.north_boundary = Window.new description: 'a glass window', end_boundary: true
    add_to_locations workshop
    
    foyer = Place.new id: 'foyer', description: 'a small foyer area'
    foyer.east_boundary = porch.west_boundary
    foyer.south_boundary = Way.new description: 'a short hallway'
    foyer.west_boundary = Door.new description: 'a glass sliding door' 
    foyer.north_boundary = Way.new description: 'an area'	
    add_to_locations foyer
    
    area = Place.new id: 'area', description: 'an area'
    area.east_boundary = Way.new description: 'kitchen way'
    area.south_boundary = foyer.north_boundary
    area.west_boundary = Way.new description: 'lounge way'
    area.north_boundary = Way.new description: 'dining room way'
    add_to_locations area 
    
    dining = Place.new id: 'dining', description: 'dining room'
    dining.east_boundary = Wall.new description: 'a light red plaster wall'
    dining.south_boundary = area.north_boundary
    dining.west_boundary = Door.new description: 'double glass', end_boundary: true
    dining.north_boundary = Window.new description: 'glass window', end_boundary: true
    add_to_locations dining
    
    lounge = Place.new id: 'lounge', description: 'the lounge room'
    lounge.east_boundary = area.west_boundary
    lounge.south_boundary = Door.new description: 'sliding glass', door_state: :open, lock_state: :unlocked
    lounge.west_boundary = Door.new description: 'french doors'
    lounge.north_boundary = Window.new description: 'glass window', end_boundary: true
    add_to_locations lounge
    
    kitchen = Place.new id: 'kitchen', description: 'the kitchen'
    kitchen.east_boundary = Window.new description: 'glass window', end_boundary: true
    kitchen.south_boundary = Wall.new description: 'glass splash back'
    kitchen.west_boundary = area.east_boundary
    kitchen.north_boundary = Wall.new description: 'painted plaster wall'
    add_to_locations kitchen
    
    short_hall = Place.new id: 'short_hall', description: 'a hall'
    short_hall.east_boundary = Cupboard.new description: 'slatted wooden'
    short_hall.south_boundary = Way.new description: 'long hallway'
    short_hall.west_boundary = Wall.new description: 'wall-papered wall'
    short_hall.north_boundary = Way.new description: 'a foyer'
    add_to_locations short_hall
    
    long_hall1 = Place.new id: 'long_hall_1', description: 'a longish hall'
    long_hall1.east_boundary = Way.new description: 'hallway'
    long_hall1.south_boundary = Cupboard.new description: 'slatted wooden'
    long_hall1.west_boundary = Way.new description: 'hallway'
    long_hall1.north_boundary = short_hall.south_boundary
    add_to_locations long_hall1
    
    long_hall2 = Place.new id: 'long_hall_2', description: 'a hall'
    long_hall2.east_boundary = long_hall1.west_boundary
    long_hall2.south_boundary = Door.new description: 'wooden door', door_state: :open, lock_state: :unlocked
    long_hall2.west_boundary = Way.new description: 'longer hallway'
    long_hall2.north_boundary = Wall.new description: 'wall-papered wall'
    add_to_locations long_hall2
    
    office = Place.new id: 'office', description: 'an office room'
    office.east_boundary = Wall.new description: 'cream painted wall'
    office.south_boundary = Wall.new description: 'cream painted wall'
    office.west_boundary = Wall.new description: 'cream painted wall'
    office.north_boundary = long_hall2.south_boundary
    add_to_locations office
    
    long_hall3 = Place.new id: 'long_hall_3', description: 'a hallway'
    long_hall3.east_boundary = long_hall2.west_boundary
    long_hall3.south_boundary = Door.new description: 'wooden door', door_state: :open, lock_state: :unlocked # bathroom2
    long_hall3.west_boundary = Way.new description: 'hallway'
    long_hall3.north_boundary = Door.new description: 'glass sliding door' # atrium
    add_to_locations long_hall3
    
    bathroom2 = Place.new id: 'bathroom2', description: 'a bathroom'
    bathroom2.east_boundary = Wall.new description: 'mirror'
    bathroom2.south_boundary = Window.new description: 'glass window', end_boundary: true
    bathroom2.west_boundary = Wall.new description: 'cream tiled wall'
    bathroom2.north_boundary = long_hall3.south_boundary
    add_to_locations bathroom2
    
    long_hall4 = Place.new id: 'long_hall4', description: 'a hallway'
    long_hall4.east_boundary = long_hall3.west_boundary
    long_hall4.south_boundary = Door.new description: 'wooden door', door_state: :open, lock_state: :unlocked # Calypso bedroom
    long_hall4.west_boundary = Door.new description: 'wooden door', door_state: :open, lock_state: :unlocked  # Phoebe bedroom
    long_hall4.north_boundary = Door.new description: 'wooden door', door_state: :open, lock_state: :unlocked  # Kingsley bedroom
    add_to_locations long_hall4
    
    bedroom_c = Place.new id: 'bedroom_c', description: 'a bedroom'
    bedroom_c.east_boundary = Door.new description: 'double wooden doors', door_state: :unlocked, lock_state: :closed
    bedroom_c.south_boundary = Window.new description: 'glass window', end_boundary: true
    bedroom_c.west_boundary = Wall.new description: 'cream plaster wall'
    bedroom_c.north_boundary = long_hall4.south_boundary
    add_to_locations bedroom_c
    
    bedroom_c_cupboard = Place.new id: 'bedroom_c_cupboard', description: 'a bedroom cupboard'
    bedroom_c_cupboard.east_boundary = Wall.new description: 'cream plaster wall'
    bedroom_c_cupboard.south_boundary = Wall.new description: 'cream plaster wall'
    bedroom_c_cupboard.west_boundary = Wall.new description: 'cream plaster wall'
    bedroom_c_cupboard.north_boundary = Wall.new description: 'cream plaster wall'
    add_to_locations bedroom_c_cupboard
    
    
    bedroom_p = Place.new id: 'bedroom_p', description: 'a bedroom room'
    bedroom_p.east_boundary = long_hall4.west_boundary
    bedroom_p.south_boundary = Window.new description: 'double-glazed glass window', end_boundary: true
    bedroom_p.west_boundary = Window.new description: 'double-glazed glass window', end_boundary: true
    bedroom_p.north_boundary = Door.new description: 'double wooden doors'
    add_to_locations bedroom_p

    bedroom_p_cupboard = Place.new id: 'bedroom_p_cupboard', description: 'a bedroom cupboard'
    bedroom_p_cupboard.east_boundary = Wall.new description: 'cream plaster wall'
    bedroom_p_cupboard.south_boundary = Wall.new description: 'cream plaster wall'
    bedroom_p_cupboard.west_boundary = Wall.new description: 'cream plaster wall'
    bedroom_p_cupboard.north_boundary = Wall.new description: 'cream plaster wall'
    add_to_locations bedroom_p_cupboard
    
    bedroom_k = Place.new id: 'bedroom_k', description: 'a bedroom'
    bedroom_k.east_boundary = Wall.new description: 'cream plastered wall'
    bedroom_k.south_boundary = long_hall4.north_boundary
    bedroom_k.west_boundary = Door.new description: 'glass sliding door', end_boundary: true
    bedroom_k.north_boundary = Wall.new description: 'cream plaster wall'
    add_to_locations bedroom_k

    #bedroom_k_cupboard = Place.new id: 'bedroom_k_cupboard', description: 'a bedroom cupboard'
    #bedroom_k_cupboard.east_boundary = Wall.new description: 'cream plaster wall'
    #bedroom_k_cupboard.south_boundary = Wall.new description: 'cream plaster wall'
    #bedroom_k_cupboard.west_boundary = Wall.new description: 'cream plaster wall'
    #bedroom_k_cupboard.north_boundary = Wall.new description: 'cream plaster wall'
    #add_to_locations bedroom_k_cupboard
    
    tiny_hall = Place.new id: 'tiny_hall', description: 'a small hall'
    tiny_hall.east_boundary = Door.new description: 'light wooden door', door_state: :open  # main bedroom
    tiny_hall.south_boundary = Door.new description: 'light wooden door' #laundry
    tiny_hall.west_boundary = Way.new description: 'a long hall'
    tiny_hall.north_boundary = Wall.new description: 'wall papered wall' 
    add_to_locations tiny_hall
    
    laundry = Place.new id: 'laundry', description: 'laundry'
    laundry.east_boundary = Wall.new description: 'painted plaster wall'
    laundry.south_boundary = Door.new description: 'glass/wooden door', lock_state: :locked
    laundry.west_boundary = Wall.new description: 'wall papered plaster wall'
    laundry.north_boundary = tiny_hall.south_boundary
    add_to_locations laundry
    
    garage = Place.new id: 'garage', description: 'a garage'
    garage.east_boundary = Door.new description: 'steel rollerdoor', end_boundary: true
    garage.south_boundary = Wall.new description: 'solid brick wall'
    garage.west_boundary = Way.new description: 'a doorway', end_boundary: true
    garage.north_boundary = laundry.south_boundary
    add_to_locations garage
    
    bedroom_main = Place.new id: 'bedroom_main', description: 'a bedroom'
    bedroom_main.east_boundary = Wall.new description: 'a wall-papered wall'
    bedroom_main.south_boundary = Door.new description: 'light wooden door', door_state: :open
    bedroom_main.west_boundary = tiny_hall.east_boundary
    bedroom_main.north_boundary = porch.south_boundary
    add_to_locations bedroom_main
    
    robe = Place.new id: 'robe', description: 'a walk-in robe'
    robe.east_boundary = Window.new description: 'glass window', end_boundary: true
    robe.south_boundary = Wall.new description: 'painted plaster wall'
    robe.west_boundary = Door.new description: 'a light wooden door', door_state: :open
    robe.north_boundary = bedroom_main.south_boundary
    add_to_locations robe
    
    ensuite = Place.new id: 'ensuite', description: 'an ensuite'
    ensuite.east_boundary = robe.west_boundary
    ensuite.south_boundary = Wall.new description: 'a mirror'
    ensuite.west_boundary = Wall.new description: 'a tiled and painted wall'
    ensuite.north_boundary = Wall.new description: 'a glass and tiled wall'
    add_to_locations ensuite

    craft_room = Place.new id: 'craft_room', description: 'the craftroom'
    craft_room.east_boundary = lounge.west_boundary
    craft_room.south_boundary = Wall.new description: 'wall-papered wall'
    craft_room.west_boundary = Door.new description: 'sliding glass door', end_boundary: true
    craft_room.north_boundary = Door.new description: 'sliding glass door', end_boundary: true
    add_to_locations craft_room
    
    atrium = Place.new id: 'atrium', description: 'the atrium room'
    atrium.east_boundary = foyer.west_boundary
    atrium.south_boundary = long_hall3.north_boundary
    atrium.west_boundary = Wall.new description: 'cream plaster wall'
    atrium.north_boundary = lounge.south_boundary
    add_to_locations atrium
    
    # make place-to-place linkages that haven't been made in place definitions above
    porch.east_location = workshop
    porch.south_location = bedroom_main
    porch.west_location = foyer
    workshop.west_location = porch
    foyer.east_location = porch
    foyer.south_location = short_hall
    foyer.north_location = area
    foyer.west_location = atrium
    atrium.east_location = foyer
    short_hall.north_location = foyer
    short_hall.south_location = long_hall1
    long_hall1.north_location = short_hall
    long_hall1.east_location = tiny_hall
    long_hall1.west_location = long_hall2
    long_hall2.west_location = long_hall3
    long_hall2.south_location = office
    long_hall2.east_location = long_hall1
    office.north_location = long_hall2
    long_hall3.west_location = long_hall4
    long_hall3.south_location = bathroom2
    long_hall3.north_location = atrium
    long_hall3.east_location = long_hall2
    atrium.south_location = long_hall3
    bathroom2.north_location = long_hall3
    long_hall4.west_location = bedroom_p
    long_hall4.south_location = bedroom_c
    long_hall4.east_location = long_hall3
    long_hall4.north_location = bedroom_k
    bedroom_c.north_location = long_hall4
    bedroom_c.east_location = bedroom_c_cupboard
    bedroom_p.east_location = long_hall4
    bedroom_p.north_location = bedroom_p_cupboard
    bedroom_k.south_location = long_hall4
    tiny_hall.east_location = bedroom_main
    tiny_hall.west_location = long_hall1
    tiny_hall.south_location = laundry
    garage.north_location = laundry
    laundry.south_location = garage
    laundry.north_location = tiny_hall
    bedroom_main.west_location = tiny_hall
    bedroom_main.north_location = porch
    bedroom_main.south_location = robe
    robe.west_location = ensuite
    robe.north_location = bedroom_main
    ensuite.east_location = robe
    area.east_location = kitchen
    area.west_location = lounge
    area.south_location = foyer
    area.north_location = dining
    dining.south_location = area
    kitchen.west_location = area
    lounge.west_location = craft_room
    lounge.south_location = atrium
    lounge.east_location = area
    atrium.north_location = lounge
    craft_room.east_location = lounge
   
  end
  
  def validate
    @locations.each do | id, place_object |
      # all places need four boundaries, and each boundary has a description
      # all places have four boundary locations, but some are end boundaries - if not an end boundary location then it's another place that will have a description
      
      check place_object, 'north'
      check place_object, 'south'
      check place_object, 'east'
      check place_object, 'west'
      #raise "places#validate error #{place_object.id} north_boundary" unless place_object.north_boundary.description
      #if !(place_object.respond_to? 'north_location'.to_sym)
      #  raise "places#validate error #{place_object.id} north_location did not respond"
      #else
      #  raise "places#validate error #{place_object.id} north_location not end_boundary and has no description" if !place_object.north_boundary.end_boundary and !place_object.north_location.description 
      #end
      
      #puts "#{id} south"
      #raise "places#validate error #{place_object.id} south_boundary" unless place_object.south_boundary.description
      #raise "places#validate error #{place_object.id} south_location" if !place_object.south_boundary.end_boundary and !(place_object.respond_to? 'south_location'.to_sym)
      
      #puts "#{id} east"
      #raise "places#validate error #{place_object.id} east_boundary" unless place_object.east_boundary.description
      #raise "places#validate error #{place_object.id} east_location" if !place_object.east_boundary.end_boundary and !(place_object.respond_to? 'east_location'.to_sym)
      
      #puts "#{id} west"
      #raise "places#validate error #{place_object.id} west_boundary" unless place_object.west_boundary.description
      #raise "places#validate error #{place_object.id} west_location" if !place_object.west_boundary.end_boundary and !(place_object.respond_to? 'west_location'.to_sym)
    end
  end
    
  def check place_object, compass_point
    puts "#{place_object.id} #{compass_point}" if DBG
    raise "places#validate error #{place_object.id} #{compass_point}_boundary missing description" unless place_object.send("#{compass_point}_boundary".to_sym).description
    if !(place_object.respond_to? "#{compass_point}_location".to_sym)
      raise "places#validate error #{place_object.id} #{compass_point}_location would not respond"
    else
      #raise "places#validate error #{place_object.id} #{compass_point}_location not end_boundary and has no description" if !place_object.send("#{compass_point}_boundary".to_sym).end_boundary and !(place_object.send( 'respond_to?', ("#{compass_point}_location").description))
      raise "places#validate error #{place_object.id} #{compass_point}_location not end_boundary and has no description" if !place_object.send("#{compass_point}_boundary".to_sym).end_boundary and !place_object.send("#{compass_point}_location".to_sym).description 
    end
  end
    
end