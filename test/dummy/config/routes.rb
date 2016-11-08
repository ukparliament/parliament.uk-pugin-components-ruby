Rails.application.routes.draw do
	
  mount PuginPlugin::Engine => "/pugin_plugin"

  get '/header', to: 'application#header', as: 'header'
  get '/footer', to: 'application#footer', as: 'footer'
  get '/members_card', to: 'application#members_card', as: 'members_card'

  get '/style-guide' => 'styleguide#index'  

end
