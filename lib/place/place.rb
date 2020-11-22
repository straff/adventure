class Place

  attr_accessor :id
  attr_reader :description
  attr_reader :inside
  
  attr_accessor :north_boundary
  attr_accessor :north_location
  attr_accessor :south_boundary
  attr_accessor :south_location
  attr_accessor :east_boundary
  attr_accessor :east_location
  attr_accessor :west_boundary
  attr_accessor :west_location
    
  attr_accessor :items
  attr_accessor :fixtures
  
  def initialize id:, description:, inside: true
    @id = id
    @description = description
    @inside = inside
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
  
  def inside?
    return @inside
  end
    
end