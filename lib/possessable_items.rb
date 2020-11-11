require_relative './item/item.rb'

class PossessableItems

  def initialize
    
  end
  
  def put_in_locations places
    
    places.locations['foyer'].items[:key]=Item.new 'key'
 #   places.locations['short_hall'].items[:drying_rack]=Item.new 'drying_rack'
 #   places.locations['short_hall'].east_boundary.items[:hat]=Item.new 'hat' # is a cupboard
 #   places.locations['long_hall1'].south_boundary.items[:vacuum_cleaner]=Item.new 'vacuum_cleaner'
 #   places.locations['office'].items[:laptop]=Item.new 'laptop'
 #   places.locations['bedroom_k'].items[:chocolate_eggs]=Item.new 'chocolate_eggs'
 #   places.locations['bedroom_c'].items[:chocolate_eggs]=Item.new 'chocolate_eggs'
 #   places.locations['bedroom_p'].items[:chocolate_eggs]=Item.new 'chocolate_eggs'
 #   places.locations['lounge'].items[:chocolate_eggs]=Item.new 'chocolate_eggs'
 #   places.locations['workshop'].items[:screwdriver]=Item.new 'screwdriver'
    
  end

end