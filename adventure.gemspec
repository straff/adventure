Gem::Specification.new do |s|
  s.name        = 'adventure'
  s.version     = '0.0.7'
  s.date        = '2020-10-17'
  s.summary     = "adventure - an IF genre game"
  s.description = "An adventrue app as a gem usable on command-line and rails app"
  s.authors     = ["Straff"]
  s.email       = 'straff_walton@yahoo.com.au'
  #s.files       = ["lib/adventure.rb"]
  s.files       = Dir.glob("{lib}/**/*")
  s.homepage    =
    'https://rubygems.org/gems/yeah-nah'
  s.license       = 'MIT'
end