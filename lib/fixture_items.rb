require_relative './fixture/fixture.rb'
require_relative './fixture/sewing_machine.rb'
require_relative './fixture/safe.rb'
require_relative './fixture/dishes.rb'

class FixtureItems

  attr_reader :items

  def initialize
    @items = {}
    @items[:planter]        = Fixture.new name: 'planter', description: 'planter box'
    @items[:dog_kennel]     = Fixture.new name: 'dog_kennel', description: 'a masterfully crafted dog kennel'
    @items[:wooden_shelf]   = Fixture.new name: 'wooden_shelf', description: 'a wooden books shelf'
    @items[:recycle_bin]    = Fixture.new name: 'recycle_bin', description: ' a bin for recycling recyclables'
    @items[:dishes]         = Dishes.new  name: 'dishes', description: 'dishes of varying forms'
    @items[:sewing_machine] = Fixture.new name: 'sewing_machine', description: 'a white Berlina sewing machine'
    @items[:safe]           = Fixture.new name: 'safe', description: 'an impenetrable steel safe'
  end
  
  def put_fixtures_in_locations places
    places.locations['porch'].fixtures[:planter]             = @items[:planter]
    places.locations['porch'].fixtures[:dog_kennel]          = @items[:dog_kennel]
    places.locations['foyer'].fixtures[:wooden_shelf]        = @items[:wooden_shelf]
    places.locations['short_hall'].east_boundary.fixtures[:recycle_bin] = @items[:recycle_bin]
    places.locations['kitchen'].fixtures[:dishes]            = @items[:dishes]
    places.locations['craft_room'].fixtures[:sewing_machine] = @items[:sewing_machine]
    places.locations['bedroom_k'].fixtures[:safe]            = @items[:safe]
  end

end