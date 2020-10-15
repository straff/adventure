require './place/Place.rb'
require './boundary/Door.rb'
require './boundary/Cupboard.rb'
require './boundary/Window.rb'
require './boundary/Wall.rb'
require './boundary/Way.rb'

class Places

  attr_accessor :locations
  
  def build
    @locations = Hash.new

    porch = Place.new name: 'porch', description: 'a pink tiled porch area', inside: false
    porch.west_boundary = Door.new description: 'a heavy wooden door', lock_state: :unlocked
    porch.south_boundary = Window.new description: 'a glass window'
    porch.east_boundary = Door.new description: 'a glass door'
    porch.north_boundary = Wall.new description: 'a pale green wall' 
    locations[porch.name] = porch

    workshop = Place.new name: 'workshop', description: 'a productive place'
    workshop.west_boundary = porch.east_boundary
    workshop.south_boundary = Door.new description: 'a metal roller door', end_boundary: false
    workshop.east_boundary = Wall.new description: 'a white painted plaster wall'
    workshop.north_boundary = Window.new description: 'a glass window'
    locations[workshop.name] = workshop
    
    foyer = Place.new name: 'foyer', description: 'a small foyer area'
    foyer.east_boundary = porch.west_boundary
    foyer.south_boundary = Way.new description: 'a short hallway'
    foyer.west_boundary = Door.new description: 'a glass sliding door' 
    foyer.north_boundary = Way.new description: 'an area'	
    locations[foyer.name] = foyer
 
    area = Place.new name: 'area', description: 'an area'
    area.east_boundary = Way.new description: 'kitchen way'
    area.south_boundary = foyer.north_boundary
    area.west_boundary = Way.new description: 'lounge way'
    area.north_boundary = Way.new description: 'dining room way'
    locations[area.name] = area

    dining = Place.new name: 'dining', description: 'dining room'
    dining.east_boundary = Wall.new description: 'a light red plaster wall'
    dining.south_boundary = area.north_boundary
    dining.west_boundary = Door.new description: 'double glass'  #, :closed, :locked, :end_boundary
    dining.north_boundary = Window.new description: 'glass window' #, :closed, :locked, :end_boundary
    locations[dining.name] = dining

    lounge = Place.new name: 'lounge', description: 'the lounge room' #, :inside
    lounge.east_boundary = area.west_boundary
    lounge.south_boundary = Door.new description: 'sliding glass' #, :open, :unlocked
    lounge.west_boundary = Door.new description: 'french doors' #, :closed, :unlocked
    lounge.north_boundary = Window.new description: 'glass window' #, :closed, :unlocked, :end_boundary
    locations[lounge.name] = lounge
   
    kitchen = Place.new name: 'kitchen', description: 'the kitchen' #, :inside
    kitchen.east_boundary = Window.new description: 'glass window' #, :closed, :locked, :end_boundary
    kitchen.south_boundary = Wall.new description: 'glass splash back'
    kitchen.west_boundary = area.east_boundary
    kitchen.north_boundary = Wall.new description: 'painted plaster wall'
    locations[kitchen.name] = kitchen

 
#    short_hall = Place.new 'short_hall', 'a hall', :inside
#    short_hall.east_boundary = Cupboard.new 'slatted wooden', :closed
#    short_hall.south_boundary = Way.new 'long_hall1', 'hallway'
#    short_hall.west_boundary = Wall.new 'plaster','wall-papered'
#    short_hall.north_boundary = Way.new 'foyer', 'room'
#    locations[short_hall.name] = short_hall
    
    #short_hall_cupboard = Place.new 'short_hall_cupboard', 'a cupboard', :inside
    #locations[short_hall_cupboard.name] = short_hall_cupboard

 #   long_hall1 = Place.new 'long_hall1', 'a hall', :inside
 #   long_hall1.east_boundary = Way.new 'tiny_hall', 'hallway'
 #   long_hall1.south_boundary = Cupboard.new 'slatted wooden', :closed
 #   long_hall1.west_boundary = Way.new 'more_hall1', 'hallway'
 #   long_hall1.north_boundary = short_hall.south_boundary
 #   locations[long_hall1.name] = long_hall1

 #   long_hall2 = Place.new 'long_hall2', 'a hall', :inside
 #   long_hall2.east_boundary = long_hall1.west_boundary
 #   long_hall2.south_boundary = Door.new 'wooden', :open, :unlocked
 #   long_hall2.west_boundary = Way.new 'long_hall3', 'hallway'
 #   long_hall2.north_boundary = Wall.new 'plaster', 'wall-papered'
 #   locations[long_hall2.name] = long_hall2

 #   office = Place.new 'office', 'a room', :inside
 #   office.east_boundary = Wall.new 'plaster', 'cream'
 #   office.south_boundary = Wall.new 'plaster', 'cream'
 #   office.west_boundary = Wall.new 'plaster', 'cream'
 #   office.north_boundary = long_hall2.south_boundary
 #   locations[office.name] = office

 #   long_hall3 = Place.new 'long_hall3', 'a hallway', :inside
 #   long_hall3.east_boundary = long_hall2.west_boundary
 #   long_hall3.south_boundary = Door.new 'wooden', :open, :unlocked # bathroom2
 #   long_hall3.west_boundary = Way.new 'long_hall4', 'hallway'
 #   long_hall3.north_boundary = Door.new 'glass sliding', :closed, :unlocked # atrium
 #   locations[long_hall3.name] = long_hall3

 #   bathroom2 = Place.new 'bathroom2', 'a room', :inside
 #   bathroom2.east_boundary = Wall.new 'mirror', ''
 #   bathroom2.south_boundary = Window.new 'glass', :closed, :locked, :end_boundary
 #   bathroom2.west_boundary = Wall.new 'tiled', 'cream'
 #   bathroom2.north_boundary = long_hall3.south_boundary
 #   locations[bathroom2.name] = bathroom2
    
 #   long_hall4 = Place.new 'long_hall4', 'a hallway', :inside
 #   long_hall4.east_boundary = long_hall3.west_boundary
 #   long_hall4.south_boundary = Door.new 'wooden', :open, :unlocked # Calypso bedroom
 #   long_hall4.west_boundary = Door.new 'wooden', :open, :unlocked  # Phoebe bedroom
 #   long_hall4.north_boundary = Door.new 'wooden', :open, :unlocked  # Kingsley bedroom
 #   locations[long_hall4.name] = long_hall4

 #   bedroom_c = Place.new 'bedroom_c', 'a room', :inside
 #   bedroom_c.east_boundary = Door.new 'double wooden', :unlocked, :closed
 #   bedroom_c.south_boundary = Window.new 'glass', :closed, :locked, :end_boundary
 #   bedroom_c.west_boundary = Wall.new 'plaster', 'cream'
 #   bedroom_c.north_boundary = long_hall4.south_boundary
 #   locations[bedroom_c.name] = bedroom_c

 #   bedroom_p = Place.new 'bedroom_p', 'a room', :inside
 #   bedroom_p.east_boundary = long_hall4.west_boundary
 #   bedroom_p.south_boundary = Window.new 'glass', :closed, :locked, :end_boundary
 #   bedroom_p.west_boundary = Window.new 'glass', :closed, :locked, :end_boundary
 #   bedroom_p.north_boundary = Door.new 'double wooden', :unlocked, :closed
 #   locations[bedroom_p.name] = bedroom_p

 #   bedroom_k = Place.new 'bedroom_k', 'a room', :inside
 #   bedroom_k.east_boundary = Wall.new 'plaster', 'cream'
 #   bedroom_k.south_boundary = long_hall4.north_boundary
 #   bedroom_k.west_boundary = Door.new 'glass sliding', :closed, :unlocked
 #   bedroom_k.north_boundary = Wall.new 'plaster', 'cream'
 #   locations[bedroom_k.name] = bedroom_k
    
 #   tiny_hall = Place.new 'tiny_hall', 'a hall', :inside
 #   tiny_hall.east_boundary = Door.new 'light wooden', :open, :unlocked  # main bedroom
 #   tiny_hall.south_boundary = Door.new 'light wooden', :closed, :unlocked #laundry
 #   tiny_hall.west_boundary = Way.new 'long_hall1', 'xx - way desc8 - xx'
 #   tiny_hall.north_boundary = Wall.new 'plaster', 'wall papered' 
 #   locations[tiny_hall.name] = tiny_hall

 #   laundry = Place.new 'laundry', 'a room', :inside
 #   laundry.east_boundary = Wall.new 'plaster','painted'
 #   laundry.south_boundary = Door.new 'glass and wooden', :closed, :locked
 #   laundry.west_boundary = Wall.new 'plaster','wall papered'
 #   laundry.north_boundary = tiny_hall.south_boundary
 #   locations[laundry.name] = laundry

 #   garage = Place.new 'garage', 'an area', :inside
 #   garage.east_boundary = Door.new 'steel rollerdoor', :closed, :unlocked, :end_boundary
 #   garage.south_boundary = Wall.new 'solid brick', 'painted cream'
 #   garage.west_boundary = Way.new 'doorway', 'dw'
 #   garage.north_boundary = laundry.south_boundary
 #   locations[garage.name] = garage
        
 #   main_bedroom = Place.new 'main_bedroom', 'a room', :inside
 #   main_bedroom.east_boundary = Wall.new 'plaster','wall papered'
 #   main_bedroom.south_boundary = Door.new 'light wooden',:open,:unlocked
 #   main_bedroom.west_boundary = tiny_hall.east_boundary
 #   main_bedroom.north_boundary = porch.south_boundary
 #   locations[main_bedroom.name] = main_bedroom

 #   robe = Place.new 'robe', 'a room', :inside
 #   robe.east_boundary = Window.new 'glass', :closed, :unlocked, :end_boundary
 #   robe.south_boundary = Wall.new 'plaster','painted'
 #   robe.west_boundary = Door.new 'light wooden',:open,:unlocked
 #   robe.north_boundary = main_bedroom.south_boundary
 #   locations[robe.name] = robe

 #   bathroom1 = Place.new 'bathroom1', 'a room', :inside
 #   bathroom1.east_boundary = robe.west_boundary
 #   bathroom1.south_boundary = Wall.new 'mirrored',''
 #   bathroom1.west_boundary = Wall.new 'plaster','painted'
 #   bathroom1.north_boundary = Wall.new 'plaster','painted'
 #   locations[bathroom1.name] = bathroom1
    
 
 
 
 





    
    
#    craft_room = Place.new 'craft_room', 'a room', :inside
#    craft_room.east_boundary = lounge.west_boundary
#    craft_room.south_boundary = Wall.new 'plaster', 'wall-papered'
#    craft_room.west_boundary = Door.new 'sliding glass', :closed, :locked, :end_boundary
#    craft_room.north_boundary = Door.new 'sliding glass', :closed, :locked, :end_boundary
#    locations[craft_room.name] = craft_room
    
#    atrium = Place.new 'atrium', 'a room', :inside
#    atrium.east_boundary = foyer.west_boundary
#    atrium.south_boundary = long_hall3.north_boundary
#    atrium.west_boundary = Wall.new 'plaster', 'cream'
#    atrium.north_boundary = lounge.south_boundary
#    locations[atrium.name] = atrium
        
    # make place-to-place linkages
    porch.west_location = foyer
    porch.east_location = workshop
    workshop.west_location = porch
    foyer.east_location = porch
#    foyer.south_location = short_hall
    foyer.north_location = area
#    foyer.west_location = atrium
#    atrium.east_location = foyer
#    short_hall.north_location = foyer
#    short_hall.south_location = long_hall1
#    long_hall1.north_location = short_hall
#    long_hall1.east_location = tiny_hall
#    long_hall1.west_location = long_hall2
#    long_hall2.west_location = long_hall3
#    long_hall2.south_location = office
#    long_hall2.east_location = long_hall1
#    long_hall3.west_location = long_hall4
#    long_hall3.south_location = bathroom2
#    long_hall3.north_location = atrium
#    long_hall3.east_location = long_hall2
#    atrium.south_location = long_hall3
#    bathroom2.north_location = long_hall3
#    long_hall4.west_location = bedroom_p
#    long_hall4.south_location = bedroom_c
#    long_hall4.east_location = long_hall3
#    long_hall4.north_location = bedroom_k
#    bedroom_c.north_location = long_hall4
#    bedroom_p.east_location = long_hall4
#    bedroom_k.south_location = long_hall4
#    tiny_hall.east_location = main_bedroom
#    tiny_hall.west_location = long_hall1
#    tiny_hall.south_location = laundry
#    laundry.south_location = garage
#    laundry.north_location = tiny_hall
#    main_bedroom.west_location = tiny_hall
#    main_bedroom.north_location = porch
#    main_bedroom.south_location = robe
#    robe.west_location = bathroom1
#    robe.north_location = main_bedroom
#    bathroom1.east_location = robe
    area.east_location = kitchen
    area.west_location = lounge
    area.south_location = foyer
    area.north_location = dining
    dining.south_location = area
    kitchen.west_location = area
    #lounge.west_location = craft_room
    #lounge.south_location = atrium
    #lounge.east_location = area
#    atrium.north_location = lounge
#    craft_room.east_location = lounge
#    
  end

end