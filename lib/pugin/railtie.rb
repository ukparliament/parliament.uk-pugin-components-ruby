require 'pugin/view_helpers'
module Pugin
	class Railtie < Rails::Railtie
		initializer 'pugin.view_helpers' do 
			ActionView::Base.send(:include, ViewHelpers)
		end
	end
end