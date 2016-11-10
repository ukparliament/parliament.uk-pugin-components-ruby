class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  	def header
  		render html: PUGIN.get_component_by_model('modules/header')
  	end

    def test

        @person = Person.new
        render html: PUGIN.get_component_by_model('modules/test2')
    end

end
