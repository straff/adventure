class Place

  attr_reader :name
  attr_reader :type
  attr_accessor :north_boundary
  attr_accessor :north_location
  attr_accessor :south_boundary
  attr_accessor :south_location
  attr_accessor :east_boundary
  attr_accessor :east_location
  attr_accessor :west_boundary
  attr_accessor :west_location
  
  attr_reader :inside_or_outside
  
  attr_accessor :items
  attr_accessor :fixtures
  
  def initialize name, type, inside_or_outside
    @name = name
    @type = type
    @inside_or_outside = inside_or_outside
    @items = Hash.new
    @fixtures = Hash.new
  end
  
  def auto_action_fixtures
    @fixtures.each_pair { |fixture_name, fixture| fixture.auto_action_fixture if fixture.respond_to? :auto_action_fixture }
    #@fixtures.each_pair { |fixture_name, fixture| fixture.get if fixture.respond_to? :get }
  end
  
  def to_s
    return @name
  end
  
  def look
    puts "   west is #{self.west_boundary}"
    puts "  south is #{self.south_boundary}"
    puts "   east is #{self.east_boundary}"
    puts "  north is #{self.north_boundary}"
    puts ''
    puts 'The following items are here:' if self.items.count > 0 or self.fixtures.count > 0
    self.items.each_pair {| item,value | puts "\t#{value.to_s} #{value.status_description}" }
    self.fixtures.each_pair {| fixture,value | puts "\t#{value.to_s} #{value.status_description}" }
    puts ''
  end
  
  def outside?
    return true if @inside_or_outside == :outside
    return false
  end
  
  def inside?
    not outside?
  end
  
end