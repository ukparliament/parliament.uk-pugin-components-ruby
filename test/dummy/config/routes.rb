Rails.application.routes.draw do

  mount Pugin::Engine => "/pugin"

  get '/header', to: 'application#header', as: 'header'
  get '/footer', to: 'application#footer', as: 'footer'
  get '/members_card', to: 'application#members_card', as: 'members_card'
  get 'test', to: 'application#test', as: 'test'

end
