Rails.application.routes.draw do

  mount Pugin::Engine => "/pugin"

  get '/header', to: 'application#header', as: 'header'
  get '/footer', to: 'application#footer', as: 'footer'
  get '/definition_list', to: 'application#definition_list', as: 'definition_list'
  get '/profile_card_data', to: 'application#profile_card_data', as: 'profile_card_data'
  get '/profile_card_no_data', to: 'application#profile_card_no_data', as: 'profile_card_no_data'
  get '/panel', to: 'application#panel', as: 'panel'
  get '/breadcrumb', to: 'application#breadcrumb', as: 'breadcrumb'

  get 'test', to: 'application#test', as: 'test'

end
