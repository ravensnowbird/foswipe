$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "foswipe/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "foswipe"
  s.version     = Foswipe::VERSION
  s.authors     = ["Vivek Sampara"]
  s.email       = ["ravensnowbird@gmail.com"]
  s.homepage    = "http://ravensnowbird.github.io/foswipe"
  s.summary     = "Open source support system"
  s.description = "Using Rails Engine"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.9"
 
  s.add_development_dependency 'sass-rails'

  s.add_development_dependency "jquery-rails"

  s.add_dependency 'adminlte-rails'

  s.add_development_dependency "sqlite3"

  s.add_dependency "devise"

  s.add_dependency 'dragonfly', '~> 1.0.7'

end
