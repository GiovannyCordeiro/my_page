Rails.application.routes.draw do
  root 'open#index'
  get '/my_annotations', controller: 'open', action: 'myAnotation'
  get '/my_annotations/tags', controller: 'open', action: 'anotationTags'
  get '/my_annotations/tags/:type_tag', controller: 'open', action: 'anotationTags'
  resources :annotations
end
