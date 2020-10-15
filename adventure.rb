
class Adventure
	require './place/places.rb'
	require './adventure_helper.rb'
	require './possessable_items.rb'
	require './fixture_items.rb'
	require './quester.rb'
	require './mission.rb'
	include AdventureHelper

	attr_accessor :questers
	attr_accessor :quester
	attr_reader   :places
	attr_reader   :possessable_items
	attr_reader   :fixture_items
	attr_reader   :mission


	# we have at least one quester, setup at start of adventure instance
	def initialize name, age, facing_direction=:west, place=nil
	  @places = Places.new
	  @places.build

	  @possessable_items = PossessableItems.new
	  @possessable_items.put_in_locations places

	  @fixture_items = FixtureItems.new
	  @fixture_items.put_fixtures_in_locations places

	  @mission = Mission.new ([ :key, :dishes, :chocolate_eggs, :screwdriver ]), 'Your mission is to collect a key, wash the dishes, collect a screwdriver, collect chocolate eggs. Sounds easy.'
	  #@mission.questers[0].push quester
	  @mission.fixtures = fixture_items
	  
	  @questers = Hash.new
	  @quester = Quester.new name, age, facing_direction, places.locations['porch']
	  @questers[0] = @quester
	end

	def show_debug current_place, facing_boundary, quester
	  dbg "current_place #{current_place}"
	  dbg "current_place items #{current_place.items.inspect}" if current_place.items
	  dbg "current_place fixtures #{current_place.fixtures.inspect}" if current_place.fixtures
	  dbg "facing_direction #{quester.facing_direction}"
	  dbg "facing_boundary #{facing_boundary}"
	  dbg "quester possessions #{quester.possessions.inspect}" if quester.possessions
	end
end
