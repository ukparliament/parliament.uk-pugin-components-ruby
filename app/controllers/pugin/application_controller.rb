module Pugin
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def self.get_component_by_single(component_name, properties = {})
        render :partial => "layouts/pugin/#{component_name}", locals: {my_properties: properties}
    end

    def self.get_component_by_model(component_name, model = nil)
        render :partial => "layouts/pugin/#{component_name}", locals: {object: model}
    end

  end
end
