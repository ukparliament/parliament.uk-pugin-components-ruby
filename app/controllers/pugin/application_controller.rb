module Pugin
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def self.get_component(component_name, properties = {})
        render :partial => "layouts/pugin_plugin/#{component_name}", locals: {my_properties: properties}
    end

  end
end
