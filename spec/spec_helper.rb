require 'simplecov'
require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
                                                                 Coveralls::SimpleCov::Formatter,
                                                                 SimpleCov::Formatter::HTMLFormatter
                                                               ])
SimpleCov.start

ENV['RAILS_ENV'] ||= 'test'

ENV['BANDIERA_URL'] ||= 'localhost:5000'
require 'bandiera/client'
require 'pugin/bandiera'

require File.expand_path('../dummy/config/environment.rb', __FILE__)
require 'rspec/rails'
require 'factory_girl_rails'

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.mock_with :rspec
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = 'random'
end
