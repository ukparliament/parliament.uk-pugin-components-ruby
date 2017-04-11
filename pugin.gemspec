$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'pugin/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'pugin'
  s.version     = Pugin::VERSION
  s.authors     = ['Matt Rayner']
  s.email       = ['mattrayner1@gmail.com']
  s.homepage    = 'https://github.com/ukparliament/pugin'
  s.summary     = 'Pugin is a component-based pattern design library for UK Parliament microservices.'
  s.description = 'Pugin is a component-based pattern design library that holds all of the reusable partials, styles and scripts for elements of UK Parliament microservices.'
  s.license     = 'Nonstandard'

  s.files = Dir["{app,config,db,lib}/**/*", 'LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'haml', '~> 4.0'

  s.add_development_dependency 'rails', '~> 5.0.1'
  s.add_development_dependency 'sqlite3', '~> 1.3'
  s.add_development_dependency 'rspec-rails', '~> 3.5'
  s.add_development_dependency 'capybara', '~> 2.12'
  s.add_development_dependency 'factory_girl_rails', '~> 4.8'
  s.add_development_dependency 'simplecov', '~> 0.12'
  s.add_development_dependency 'coveralls', '~> 0.8'
  s.add_development_dependency 'rubocop', '~> 0.47'
  s.add_development_dependency 'pry', '~> 0.10'
end
