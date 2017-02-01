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
  s.summary     = 'Pugin is a component-based pattern design library for UK PDS microservices.'
  s.description = 'Pugin is a component-based pattern design library that holds all of the reusable partials, styles and scripts for elements of Parliamentary Digital Service microservices.'
  s.license     = 'Open Parliament License'

  s.files = Dir["{app,config,db,lib}/**/*", 'LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'rails', '~> 5.0.1'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'coveralls'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'pry'
end
