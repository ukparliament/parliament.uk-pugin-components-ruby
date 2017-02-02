module Pugin
  class Engine < ::Rails::Engine
    isolate_namespace Pugin

    initializer 'pugin.assets.precompile' do |app|
      app.config.assets.precompile += %w(pugin/pugin.js pugin/pugin.css pugin/*.png pugin/*.jpg pugin/*.jpeg
                                         pugin/*.gif pugin/*.svg pugin/*.ico)
    end

    config.generators do |g|
      g.test_framework :rspec, fixture: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.assets false
      g.helper false
    end
  end
end
