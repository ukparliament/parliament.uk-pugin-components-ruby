$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "pugin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "pugin"
  s.version     = Pugin::VERSION
  s.authors     = ["Jake Mulley"]
  s.email       = ["mulleyjb@parliament.uk"]
  s.homepage    = "https://github.com/ukpds/pugin"
  s.summary     = "Pugin is a component-based pattern design library for UK PDS microservices."
  s.description = "Pugin is a component-based pattern design library that holds all of the reusable partials, styles and scripts for elements of Parliamentary Digital Service microservices."
  s.license     = "Open Parliament License"

  s.files = Dir["{app,config,db,lib}/**/*", "OPL", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.0", ">= 5.0.0.1"

  s.add_development_dependency "sqlite3"
end
