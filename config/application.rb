Bundler.require(*Rails.groups)

module Pugin
  class Application < Rails::Application

    # Turn off Sprockets
    config.assets.enabled = false

    # Turn off asset generation during scaffold generation
    config.generators do |g|
        g.assets false
    end

  end
end

