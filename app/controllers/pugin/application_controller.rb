require 'ostruct'

module Pugin
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def self.get_component(component_name, model = nil)
        if model.is_a?(Hash)
            model = OpenStruct.new(model)
            render :partial => "layouts/pugin/#{component_name}", locals: {object: model}
        else
            render :partial => "layouts/pugin/#{component_name}", locals: {object: model}
        end
    end

  end
end
