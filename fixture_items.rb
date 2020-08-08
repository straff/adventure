require './fixture/fixture.rb'
require './fixture/sewing_machine.rb'
require './fixture/safe.rb'
require './fixture/dishes.rb'

class FixtureItems

  attr_reader :items

  def initialize
    @items = {}
    @items[:planter]        = Fixture.new 'planter'
    @items[:wooden_shelf]   = Fixture.new 'wooden_shelf'
    @items[:recycle_bin]    = Fixture.new 'recycle_bin'
    @items[:dishes]         = Dishes.new 'dishes'
    @items[:sewing_machine] = Fixture.new 'sewing_machine'
    @items[:safe]           = Fixture.new 'safe'
  end
  
  def put_fixtures_in_locations places
    places.locations['porch'].fixtures[:planter]             = @items[:planter]
    places.locations['foyer'].fixtures[:wooden_shelf]        = @items[:wooden_shelf]
    places.locations['short_hall'].east_boundary.fixtures[:recycle_bin] = @items[:recycle_bin]
    places.locations['kitchen'].fixtures[:dishes]            = @items[:dishes]
    places.locations['craft_room'].fixtures[:sewing_machine] = @items[:sewing_machine]
    places.locations['bedroom_k'].fixtures[:safe]            = @items[:safe]
  end

end