require 'pugin/version'

module Pugin
  ASSET_VERSION = '1.7.5'.freeze
  ASSET_LOCATION_URL = ENV.fetch('ASSET_LOCATION_URL', 'https://s3-eu-west-1.amazonaws.com/web1live.pugin-website')
  STATIC_ASSET_LOCATION_URL = ENV.fetch('STATIC_ASSET_LOCATION_URL', 'https://s3-eu-west-1.amazonaws.com/web1live.static-assets')
  STATIC_ASSET_PUBLIC_LOCATION_URL = ENV.fetch('STATIC_ASSET_PUBLIC_LOCATION_URL', 'https://s3-eu-west-1.amazonaws.com/web1live.static-assets-public')
  class << self
		attr_writer :alternates

		def alternates
			@alternates || []
		end

  	# Inspired by bootsrap-sass
  	def load!
  		if rails?
  			register_rails_files
  		elsif sinatra?
  			register_sinatra_files
  		elsif sprockets?
  			register_sprockets
			end

			# Try and load HAML, raising an error if we are not able to
			begin
				require 'haml'
			rescue LoadError => e
				raise(LoadError, "pugin requires the 'haml' gem. Please check it is in your Gemfile - #{e.message}")
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
      		setup_features
		end

		def register_sinatra_files
			add_i18n_paths
			setup_features
			require 'pugin/view_helpers'
		end

		def add_i18n_paths
			require 'i18n'
			I18n.load_path += Dir[File.join(gem_path, 'config', 'locales', '*.yml')]
		end

		def setup_bandiera
			raise(LoadError, 'pugin requires the host application to be using the bandiera-client gem. Please check your Gemfile and try again.') unless defined?(::Bandiera::Client)
			raise(LoadError, 'pugin requires the environment variable BANDIERA_URL to be set. Please set the environment variable and try again.') unless ENV['BANDIERA_URL']

			require 'pugin/bandiera'
			include PuginBandieraClient
		end

		def setup_features
			setup_bandiera
			require 'pugin/feature'
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
