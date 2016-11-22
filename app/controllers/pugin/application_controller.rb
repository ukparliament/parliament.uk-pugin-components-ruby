require 'ostruct'

module Pugin
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def self.get_component(component_name, properties = {})
        render :partial => "layouts/pugin/#{component_name}", locals: {properties: properties}
    end

  end
end
