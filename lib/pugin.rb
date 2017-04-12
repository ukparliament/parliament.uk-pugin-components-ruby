require 'pugin/engine'
require 'pugin/railtie'
require 'pugin/version'

module Pugin
  ASSET_VERSION = '1.2.8'.freeze
  ASSET_LOCATION_URL = ENV.fetch('ASSET_LOCATION_URL', 'https://s3-eu-west-1.amazonaws.com/web1devci.pugin-website')
end
