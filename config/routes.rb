Rails.application.routes.draw do
  root 'open#index'
  get '/my_anotations', controller: 'open', action: 'myAnotation'
  get '/my_anotations/tags', controller: 'open', action: 'anotationTags'
  resources :annotations
end
