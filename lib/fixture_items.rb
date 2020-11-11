require_relative './fixture/fixture.rb'
require_relative './fixture/sewing_machine.rb'
require_relative './fixture/safe.rb'
require_relative './fixture/dishes.rb'

class FixtureItems

  attr_reader :items

  def initialize
    @items = {}
    @items[:planter]        = Fixture.new name: 'planter'
    @items[:wooden_shelf]   = Fixture.new name: 'wooden_shelf'
    @items[:recycle_bin]    = Fixture.new name: 'recycle_bin'
    @items[:dishes]         = Dishes.new  name: 'dishes'
    @items[:sewing_machine] = Fixture.new name: 'sewing_machine'
    @items[:safe]           = Fixture.new name: 'safe'
  end
  
  def put_fixtures_in_locations places
    places.locations['porch'].fixtures[:planter]         = @items[:planter]
    places.locations['foyer'].fixtures[:wooden_shelf]        = @items[:wooden_shelf]
 #   places.locations['short_hall'].east_boundary.fixtures[:recycle_bin] = @items[:recycle_bin]
 #   places.locations['kitchen'].fixtures[:dishes]            = @items[:dishes]
 #   places.locations['craft_room'].fixtures[:sewing_machine] = @items[:sewing_machine]
 #   places.locations['bedroom_k'].fixtures[:safe]            = @items[:safe]
  end

end