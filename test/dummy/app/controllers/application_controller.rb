class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  	def header
  		render html: PUGIN.get_component_by_model('modules/header')
  	end

    def footer
        render html: PUGIN.get_component_by_model('modules/footer')
    end

    def panel
        render html: PUGIN.get_component_by_model('modules/panel')
    end

    def profile_card_data_model
        @person = Person.new
        render html: PUGIN.get_component_by_model('modules/profile-card', @person)
    end

    def profile_card_data_hash
        person = {name: "Diane"}
        render html: PUGIN.get_component_by_single('modules/profile-card', person)
    end

    def profile_card_no_data
        render html: PUGIN.get_component_by_model('modules/profile-card')
    end

    def breadcrumb
        render html: PUGIN.get_component_by_model('modules/breadcrumb')
    end

    def definition_list
        render html: PUGIN.get_component_by_model('modules/definition-list')
    end

end
