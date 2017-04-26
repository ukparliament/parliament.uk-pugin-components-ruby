require 'pugin/version'

module Pugin
  ASSET_VERSION = '1.3.0'.freeze
  ASSET_LOCATION_URL = ENV.fetch('ASSET_LOCATION_URL', 'https://s3-eu-west-1.amazonaws.com/web1devci.pugin-website')

  class << self
  	# Inspired by bootsrap-sass
  	def load!
  		if rails?
  			register_rails_files
  		elsif sinatra?
  			add_i18n_paths
  		elsif sprockets?
  			register_sprockets
			end
		end

		# Paths
		def gem_path
			@gem_path ||= File.expand_path '..', File.dirname(__FILE__)
		end

		def images_path
			File.join assets_path, 'images'
		end

		def javascripts_path
			File.join assets_path, 'javascripts'
		end

		def stylesheets_path
			File.join assets_path, 'stylesheets'
		end

		def views_path
			File.join gem_path, 'app', 'views'
		end

		def assets_path
			@assets_path ||= File.join gem_path, 'app', 'assets'
		end

		# Environment detection helpers
		def rails?
			defined?(::Rails)
		end

		def sinatra?
			defined?(::Sinatra)
		end

		def sprockets?
			defined?(::Sprockets)
		end

		private

		def register_rails_files
			require 'pugin/engine'
      require 'pugin/railtie'
		end

		def add_i18n_paths
			require 'i18n'
			I18n.load_path += Dir[File.join(gem_path, 'config', 'locales', '*.yml')]
		end

		def register_sprockets
			Sprockets.append_path(images_path)
			Sprockets.append_path(javascripts_path)
			Sprockets.append_path(stylesheets_path)
			Sprockets.append_path(views_path)
		end
	end
end

Pugin.load!
