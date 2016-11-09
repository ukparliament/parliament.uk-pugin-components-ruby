class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  	def header

        @person = Person.new

  		render html: PUGIN.get_component_by_model('modules/test', @person)
  	end

    def test
        render html: PUGIN.get_component_by_model('modules/test2')
    end

end
